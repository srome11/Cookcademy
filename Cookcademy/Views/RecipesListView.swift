//
//  ContentView.swift
//  Cookcademy
//
//  Created by Scott Rome on 5/26/22.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject var recipeData = RecipeData()          //Instance of ViewModel @StateObjec to it updates view when changes are made
    var body: some View {
        
        List {
            ForEach(recipes) { recipe in
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
        }
        .navigationTitle(navigationTitle)
        }
    }

extension RecipesListView {
    var recipes: [Recipe] {
        recipeData.recipes
    }
    
    var navigationTitle: String {
        "All Recipes"
    }
}



struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipesListView()
        }
    }
}
