//
//  RecipeCard.swift
//  Recipe
//
//  Created by Jonas Küpper on 05.10.26.
//

import SwiftUI

struct RecipeCard: View {
    @Binding var recipe: Recipe
    @State var inList: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.system(size: 36))
                        .bold()
                        .lineLimit(3, reservesSpace: true)
                    Spacer()
                          .frame(height: 20)
                    HStack {
                        Label("\(recipe.durationInMinutes) minute" + (recipe.durationInMinutes < 1 ? "" : "s"), systemImage: "clock.fill")
                            .foregroundStyle(.black)
                    }
                }
                Spacer()
                VStack {
                    if (!inList) {
                        GlassIconButton(systemImage: recipe.isLiked ? "heart.fill" : "heart") {
                            recipe.isLiked.toggle()
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding(20)
        .background(recipe.color ?? Color.lavender)
        .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}

#Preview {
    @Previewable @State var recipe: Recipe = MockData.recipe
    ScrollView {
        RecipeCard(recipe: $recipe)
    }
    .safeAreaPadding()
    
}
