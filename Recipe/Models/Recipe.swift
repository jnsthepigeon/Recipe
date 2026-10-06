//
//  Recipe.swift
//  Recipe
//
//  Created by Jonas Küpper on 28.09.26.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    
    var name: String
    var durationInMinutes: Int
    var isLiked: Bool = false
    var rating: Double = 0.0
    var ingredients: [Ingredient]
    var instructionPlan: InstructionPlan
    var nutrition: Nutrition
    
    var color: Color? = Color.lavender
}

struct Ingredient: Identifiable {
    let id = UUID()
    
    var name: String
    var amount: Double
    var unit: IngredientsUnit
}

enum IngredientsUnit {
    case gram,
         milliter,
         teaspoon,
         tablespoon,
         piece
    
    var symbol: String {
        switch self {
            case .gram: "g"
            case .piece: "Stk."
            case .milliter: "ml"
        case .teaspoon:
            "TL"
        case .tablespoon:
            "EL"
        }
    }
}

struct InstructionPlan {
    var instructions: [Instruction]
}

struct Instruction: Identifiable {
    let id = UUID()
    
    var title: String
    var text: String
}

struct Nutrition {
    var calories: Double
    var protein: Double?
    var carbohydrates: Double?
    var sugars: Double?
    var fat: Double?
    var saturatedFat: Double?
    var fiber: Double?
    var salt: Double?
}
