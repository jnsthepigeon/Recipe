import SwiftUI

struct MainTabView: View {
    @State private var recipes: [Recipe] = []
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house") {
                HomeView(recipes: $recipes)
            }
            Tab("My Recipes", systemImage: "book") {
                MyRecipesView(recipes: $recipes)
            }
            Tab("Profile", systemImage: "person") {
                ProfileView()
            }
        }
    }
}
