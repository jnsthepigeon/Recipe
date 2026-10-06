//
//  NutritionView.swift
//  Recipe
//
//  Created by Jonas Küpper on 28.09.26.
//

import SwiftUI

struct NutritionView: View {
    @Environment(\.dismiss) var dismiss
    @State var nutrition: Nutrition
    
    private func formatted(_ value: Double?, unit: String) -> String {
        guard let value else { return "-" }
        return "\(value.formatted(.number)) \(unit)"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center) {
                Text("Nutritions")
                    .font(.title)
                    .bold()
                Spacer()
                IconButton(systemImage: "xmark") {
                    dismiss()
                }
            }

            VStack(spacing: 0) {
                NutritionRow(title: "Calories", value: "\(nutrition.calories.formatted(.number)) kcal")
                NutritionRow(title: "Protein", value: formatted(nutrition.protein, unit: "g"))
                NutritionRow(title: "Carbohydrates", value: formatted(nutrition.carbohydrates, unit: "g"))
                NutritionRow(title: "Sugars", value: formatted(nutrition.sugars, unit: "g"))
                NutritionRow(title: "Fat", value: formatted(nutrition.fat, unit: "g"))
                NutritionRow(title: "Saturated Fat", value: formatted(nutrition.saturatedFat, unit: "g"))
                NutritionRow(title: "Fiber", value: formatted(nutrition.fiber, unit: "g"))
                NutritionRow(title: "Salt", value: formatted(nutrition.salt, unit: "g"))
            }
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .strokeBorder(.quaternary, lineWidth: 1)
            )
        }
        .padding()
        .background(.white)
    }
}

private struct NutritionRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.primary)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
        .frame(minHeight: 44)
        .background(
            Rectangle()
                .fill(.clear)
        )
        .overlay(alignment: .bottom) {
            Divider()
                .padding(.leading)
        }
    }
}

#Preview {
    @Previewable @State var nutritions: Nutrition = Nutrition(calories: 456)
    @State var showingSheet: Bool = true

    VStack {
        Text("Nutrition Preview")
    }
    .sheet(isPresented: $showingSheet) {
        VStack {
            NutritionView(nutrition: nutritions)
            Spacer()
        }
    }
}
