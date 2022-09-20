//
//  Artists.swift
//  Artists-app
//
//  Created by Sena Kurtak on 20.09.2022.
//

import Foundation

class Artists: Equatable, Hashable{
    
    var artist_id : Int?
    var artist_name : String?
    var artist_image : String?
    
    init(){
        
    }
    
    init(artist_id:Int?,artist_name:String?,artist_image:String?){
        self.artist_id = artist_id
        self.artist_name = artist_name
        self.artist_image = artist_image
    }
    
    var hashValue: Int{
        get {
            return artist_id.hashValue
        }
    }
    
    static func == (lhs:Artists, rhs: Artists)->Bool{
        return lhs.artist_id == rhs.artist_id
    }
}
