//
//  MochData.swift
//  Recipe
//
//  Created by Jonas Küpper on 05.10.26.
//

import SwiftUI

struct MockData {
    static var recipe: Recipe = Recipe(
        name: "Mix Grilled Chicken Salad",
        durationInMinutes: 20,
        isLiked: false,
        rating: 4.7,
        ingredients: [
            Ingredient(name: "Chicken Breast", amount: 200, unit: .gram),
            Ingredient(name: "Lettuce", amount: 1, unit: .piece),
            Ingredient(name: "Tomato", amount: 2, unit: .piece)
        ],
        instructionPlan: InstructionPlan(instructions: [
            Instruction(title: "Grill chicken", text: "Season and grill the chicken until cooked."),
            Instruction(title: "Prepare salad", text: "Chop vegetables and mix with dressing."),
            Instruction(title: "Combine", text: "Slice chicken and add to salad.")
        ]),
        nutrition: Nutrition(calories: 570),
        color: Color.lavender
    )
    
    static var recipes: [Recipe] = [
        recipe,
        Recipe(
            name: "Aegean Breeze Salad",
            durationInMinutes: 20,
            isLiked: false,
            rating: 4.7,
            ingredients: [
                Ingredient(name: "Blattsalat", amount: 1.0, unit: .piece)
            ],
            instructionPlan: InstructionPlan(instructions: [
                Instruction(title: "Salat schneiden", text: "")
            ]),
            nutrition: Nutrition(calories: 456),
            color: Color.lavender
        ),
        Recipe(
            name: "Caesar Salad",
            durationInMinutes: 25,
            isLiked: false,
            rating: 4.5,
            ingredients: [
                Ingredient(name: "Blattsalat", amount: 1.0, unit: .piece)
            ],
            instructionPlan: InstructionPlan(instructions: [
                Instruction(title: "Salat schneiden", text: "")
            ]),
            nutrition: Nutrition(calories: 645),
            color: Color.lime
        )
    ]
    
    static var favorites: [Recipe] = []
}

#Preview {
    
}
