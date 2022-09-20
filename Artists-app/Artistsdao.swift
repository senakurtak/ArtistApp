//
//  Artistsdao.swift
//  Artists-app
//
//  Created by Sena Kurtak on 20.09.2022.
//

import Foundation

class Artistdao {
    
    let db: FMDatabase?
    
    init(){
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("artists.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
        
    }
    
    func getRandom8()->[Artists]{
        var list = [Artists]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM artists ORDER BY RANDOM() LIMIT 8", values: nil)
            
            while(rs.next()){
                let artist = Artists(artist_id: Int(rs.string(forColumn: "artist_id"))!,
                                     artist_name:  rs.string(forColumn: "artist_name")!,
                                     artist_image: rs.string(forColumn: "artist_image")!)
                list.append(artist)
            }
        }catch{
            print(error.localizedDescription)
        }
       
        db?.close()
        
        return list
    }
    
    func getRandom3FalseOptions(artist_id:Int)->[Artists]{
        var list = [Artists]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM artists WHERE artist_id !=? ORDER BY RANDOM() LIMIT 3", values: [artist_id])
            while(rs.next()){
                
                let artist = Artists(artist_id: Int(rs.string(forColumn: "artist_id"))!,
                                     artist_name:  rs.string(forColumn: "artist_name")!,
                                     artist_image: rs.string(forColumn: "artist_image")!)
                list.append(artist)
            }
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return list
    }
    
}
