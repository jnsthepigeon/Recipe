//
//  ContentView.swift
//  Recipe
//
//  Created by Jonas Küpper on 26.09.26.
//

import SwiftUI

struct ContentView: View {
    @State private var recipes = MockData.recipes
    @State private var searchText: String = ""
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(recipes: $recipes)
            }
            
            Tab("My Recipes", systemImage: "book") {
                MyRecipesView(recipes: $recipes, searchText: $searchText)
            }
            
            Tab("Profile", systemImage: "person") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
