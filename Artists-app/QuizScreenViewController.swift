//
//  QuizScreenViewController.swift
//  Artists-app
//
//  Created by Sena Kurtak on 20.09.2022.
//

import UIKit

class QuizScreenViewController: UIViewController {
    
    @IBOutlet weak var labelTrue: UILabel!
    @IBOutlet weak var labelFalse: UILabel!
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    
    var questions = [Artists]()
    var falseOptions = [Artists]()
    var trueOption = Artists()
    
    var questionCounter = 0
    var trueCounter = 0
    var falseCounter = 0
    
    var options = [Artists]()
    
    var optionsMixedList = Set <Artists>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = Artistdao().getRandom8()
        
        for q in questions{
            print(q.artist_name!)
        }
                downloadQuestion()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! ResultScreenViewController
        gidilecekVC.numberofTrue = trueCounter
    }
    
    
    func downloadQuestion(){
        
        labelQuestionNumber.text = "Question Number :\(questionCounter+1)"
        labelTrue.text = "True = \(trueCounter)"
        labelFalse.text  = "False = \(falseCounter)"
        
        trueOption = questions[questionCounter]
        
        imageView.image = UIImage(named: trueOption.artist_image!)
        
        falseOptions = Artistdao().getRandom3FalseOptions(artist_id: trueOption.artist_id!)
        
        optionsMixedList.removeAll()
        
        optionsMixedList.insert(trueOption)
        optionsMixedList.insert(falseOptions[0])
        optionsMixedList.insert(falseOptions[1])
        optionsMixedList.insert(falseOptions[2])
        
        options.removeAll()
        
        for s in optionsMixedList{
            options.append(s)
        }
        
        aButton.setTitle(options[0].artist_name, for: .normal)
        bButton.setTitle(options[1].artist_name, for: .normal)
        cButton.setTitle(options[2].artist_name, for: .normal)
        dButton.setTitle(options[3].artist_name, for: .normal)
        
    }
    
    func checkTrue(button: UIButton){
        let buttonText = button.titleLabel?.text
        let answer = trueOption.artist_name
        print("Button Text:\(buttonText!)")
        print("Answer:\(answer!)")
        
        if answer == buttonText{
            trueCounter += 1
        } else {
            falseCounter += 1
        }
        labelTrue.text = "True = \(trueCounter+1)"
        labelFalse.text  = "False = \(falseCounter+1)"
    }
    
    func checkQuestionCounter(){
        questionCounter += 1
        if questionCounter != 8{
            downloadQuestion()
        }else{
            performSegue(withIdentifier: "toResultScreen", sender: nil)
        }
    }
    
    @IBAction func buttonA(_ sender: Any) {
        checkTrue(button: aButton)
        checkQuestionCounter()
    }
    
    @IBAction func buttonB(_ sender: Any) {
        checkTrue(button: bButton)
        checkQuestionCounter()
    }
    
    @IBAction func buttonC(_ sender: Any) {
        checkTrue(button: cButton)
        checkQuestionCounter()
    }
    
    @IBAction func buttonD(_ sender: Any) {
        checkTrue(button: dButton)
        checkQuestionCounter()
    }
    
}
