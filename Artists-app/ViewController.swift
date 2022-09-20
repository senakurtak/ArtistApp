//
//  ViewController.swift
//  Artists-app
//
//  Created by Sena Kurtak on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        copyDataBase()
        
    }
    
    func copyDataBase(){
        // bundle oluşturuyorum. oluşturduğum sqlite dosyasının aynısını ve uzantısını yazıyorum.
        let bundlePath = Bundle.main.path(forResource: "artists", ofType: ".sqlite")
        
        // telefonun içinde kopyalayacağım dosyayı söylüyorum
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        // kopyalama için file manager sınıfından kopyalama yapacak nesneye ihtiyacım var
        let fileManager = FileManager.default
        
        let copyPlace = URL(fileURLWithPath: targetPath).appendingPathComponent("artists.sqlite")
        
        if fileManager.fileExists(atPath: copyPlace.path){
            
            print("DB already exist, no need to copy")
            
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPlace.path)
            }catch{
                print(error)
            }
        }
    }


}

