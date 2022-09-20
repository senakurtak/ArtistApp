//
//  ResultScreenViewController.swift
//  Artists-app
//
//  Created by Sena Kurtak on 20.09.2022.
//

import UIKit

class ResultScreenViewController: UIViewController {

    @IBOutlet weak var labelPerc: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    var numberofTrue : Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        if let d = numberofTrue{
            labelResult.text = "\(d) True \(8-d) False"
            labelPerc.text = "%\(d*100/8) "
        }

    }


    @IBAction func tryAgain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
