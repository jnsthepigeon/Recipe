//
//  HomeView.swift
//  Recipe
//
//  Created by Jonas Küpper on 26.09.26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    @Binding var recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 26) {
                HStack {
                    Circle()
                        .frame(width: 46, height: 46)
                    VStack(alignment: .leading) {
                        Text("Hello")
                        Text("Your Name").bold()
                    }
                    Spacer()
                }
                ScrollView(.vertical) {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Explore New Recipes").font(.title).bold()
                            Spacer()
                        }
                        TextField("Search recipes", text: $searchText)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .textFieldStyle(RoundedTextFieldStyle(icon: Image(systemName: "magnifyingglass")))
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                FastSelect(icon: "🥗", color: Color.greenLime, text: "Salad")
                                FastSelect(icon: "🍕", color: Color.peach, text: "Pizza")
                                FastSelect(icon: "🍔", color: Color.lime, text: "Burger")
                                FastSelect(icon: "🥩", color: Color.lavender, text: "Steak")
                                FastSelect(icon: "🍤", color: Color.softRed, text: "Sea Food")
                            }
                        }
                        Spacer()
                    }
                    ForEach($recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            RecipeCard(recipe: recipe)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding()
        }
    }
}

struct RoundedTextFieldStyle: TextFieldStyle {
    @State var icon: Image?
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if icon != nil {
                icon
                    .foregroundColor(Color(UIColor.darkGray))
            }
            configuration
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(
            Color(UIColor.systemGray6)
        )
        .clipShape(Capsule(style: .continuous))
        
    }
}

struct FastSelect: View {
    @State var icon: String = ""
    @State var color: Color = Color.gray
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text(icon)
                .font(.system(size: 36))
                .frame(width: 70, height: 70)
                .background(color)
                .clipShape(Circle())
            Text(text)
        }
    }
}

#Preview {
    @Previewable @State var recipes: [Recipe] = MockData.recipes
    HomeView(recipes: $recipes)
}
