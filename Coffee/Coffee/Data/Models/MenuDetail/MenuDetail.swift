//
//  MenuDetail.swift
//  Coffee
//
//  Created by Sithu Win on 26/08/2024.
//

import Foundation

enum Size {
    case SMALL
    case MEDIUM
    case LARGE
}

enum Variation {
    case HOT
    case COLD
}

enum Sugar{
    case NONE
    case THIRTY_PERCENT
    case FIFTY_PRECENT
}

struct MenuDetail{
    var boolFav:Bool
    let coffeeName:String
    let price:Double
    let description:String
    let size:Size
    let variation:Variation
    let sugar:Sugar
    let milk:[String]
    let topping:[String]
    let instruction:String
    
    init(boolFav: Bool = false, coffeeName: String, price: Double, description: String, size: Size, variation: Variation, sugar: Sugar, milk: [String], topping: [String], instruction: String) {
        self.boolFav = boolFav
        self.coffeeName = coffeeName
        self.price = price
        self.description = description
        self.size = size
        self.variation = variation
        self.sugar = sugar
        self.milk = milk
        self.topping = topping
        self.instruction = instruction
    }
}
