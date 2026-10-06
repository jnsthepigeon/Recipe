//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Jonas Küpper on 27.09.26.
//

import SwiftUI

struct RecipeDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var recipe: Recipe
    @State var showNutrition: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    recipe.color ?? Color.lavender
                }
                .frame(maxWidth: .infinity)
                .frame(height: 380)
                .clipped()
                .overlay(alignment: .bottomTrailing) {
                    Label("\(recipe.durationInMinutes) min", systemImage: "clock.fill")
                        .font(.system(size: 14, weight: .bold))
                        .padding()
                        .glassEffect()
                        .padding(.trailing, 15)
                        .padding(.bottom, 50)
                }
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(recipe.name)
                            .font(.system(size: 36))
                            .bold()
                        Spacer()
                        Label {
                            Text(recipe.rating, format: .number.precision(.fractionLength(0...1)))
                        } icon: {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                        .font(.subheadline.weight(.bold))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(.gray.opacity(0.1), in: Capsule())
                    }
                    HStack {
                        SmallCard(
                            icon: "bolt.fill",
                            cardColor: Color.greenEnergy,
                            value: "\(Int(recipe.nutrition.calories)) Kcal",
                            category: "Calories"
                        )
                        .onTapGesture {
                            showNutrition.toggle()
                        }
                        .sheet(isPresented: $showNutrition) {
                            VStack {
                                NutritionView(nutrition: recipe.nutrition)
                                    .presentationDetents([
                                        .medium,
                                        .large]
                                    )
                                Spacer()
                            }
                        }
                        SmallCard(
                            icon: "apple.meditate",
                            cardColor: Color.lavender,
                            value: "10 Healthy",
                            category: "Ingredients"
                        )
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.title2.bold())
                        
                        ForEach(Array(recipe.ingredients.enumerated()), id: \.element.id) { index, ingredient in
                            VStack(spacing: 0) {
                                HStack(alignment: .firstTextBaseline) {
                                    Text(ingredient.name)
                                    Spacer()
                                    Text("\(ingredient.amount, format: .number) \(ingredient.unit.symbol)")
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 10)
                                if index < recipe.ingredients.count - 1 {
                                    Divider()
                                }
                            }
                        }
                    }
                    .padding(.top, 12)
                    
                    VStack(alignment: .leading) {
                        Text("Instructions")
                            .font(.title2.bold())
                        
                        ForEach(Array(recipe.instructionPlan.instructions.enumerated()), id: \.element.id) { index, instruction in
                            VStack(spacing: 0) {
                                VStack(alignment: .leading) {
                                    Text("\(index+1). " + instruction.title)
                                        .bold()
                                    Spacer()
                                    Text(instruction.text)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.vertical, 10)
                            }
                        }
                    }
                    .padding(.top, 12)
                }
                .padding(24)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(
                    .white,
                    in: UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                )
                .padding(.top, -40)
            }
        }
        .scrollEdgeEffectHidden(true, for: .top)
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                IconButton(systemImage: "arrow.backward") {
                    dismiss()
                }
            }
            .sharedBackgroundVisibility(.hidden)
            
            ToolbarItem(placement: .topBarTrailing) {
                IconButton(systemImage: "square.and.arrow.up") {
                    
                }
            }
            .sharedBackgroundVisibility(.hidden)
        }
    }
    
}

private struct SmallCard: View {
    var icon: String
    var cardColor: Color
    var value: String
    var category: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: icon)
                .padding()
                .background(.white)
                .clipShape(Circle())
            Text(value)
                .bold()
            Text(category)
                .fontWeight(.light)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background {
            ZStack(alignment: .bottomTrailing) {
                cardColor
                Image(systemName: "asterisk")
                    .font(.system(size: 110, weight: .black))
                    .foregroundStyle(cardColor)
                    .saturation(2.8)
                    .offset(x: 35, y: 35)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    @Previewable @State var recipe = MockData.recipe
    NavigationStack {
        RecipeDetailView(recipe: $recipe)
    }
}
