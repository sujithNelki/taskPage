//
//  message.swift
//  taskPage
//
//  Created by Sujith on 07/09/22.
//

import Foundation


struct Message:Decodable {
    let id:Int
    let title: String
    let description:String
    let category: String
    let price: Double
    let rating: Rating
    let image: String
    
    
    enum Codingkeys: String,CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case category = "category"
        case price = "price"
        case rating = "rating"
        case image = "image"
        
    }
}
