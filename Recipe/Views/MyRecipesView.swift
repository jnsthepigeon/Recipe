//
//  MyRecipesView.swift
//  Recipe
//
//  Created by Jonas Küpper on 05.10.26.
//

import SwiftUI

struct MyRecipesView: View {
    @Binding var recipes: [Recipe]
    @Binding var searchText: String
    
    private var filteredIndices: [Int] {
        recipes.indices.filter { index in
            searchText.isEmpty || recipes[index].name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredIndices, id: \.self) { index in
                    NavigationLink {
                        RecipeDetailView(recipe: $recipes[index])
                    } label: {
                        RecipeCard(recipe: $recipes[index], inList: true)
                            .buttonStyle(.plain)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationLinkIndicatorVisibility(.hidden)
            .searchable(text: $searchText)
            .navigationTitle("My Recipes")
        }
    }
}


#Preview {
    @Previewable @State var searchText: String = ""
    @Previewable @State var recipes: [Recipe] = MockData.recipes
    MyRecipesView(recipes: $recipes, searchText: $searchText)
}
