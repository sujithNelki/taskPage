//
//  rating.swift
//  taskPage
//
//  Created by Sujith on 07/09/22.
//

import Foundation
struct Rating : Decodable {
    let rate :Double
    let count :Int
    enum Codingkeys:String,CodingKey {
        case rate = "rate"
        case count = "count"
        
    }
}
