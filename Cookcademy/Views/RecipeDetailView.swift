//
//  RecipeDetailView.swift
//  Cookcademy
//
//  Created by Scott Rome on 6/1/22.
//

import SwiftUI
 
struct RecipeDetailView: View {
  let recipe: Recipe
 
  var body: some View {
    VStack {
      HStack {
        Text("Author: \(recipe.mainInformation.author)")
          .font(.subheadline)
          .padding()
        Spacer()
      }
      HStack {
        Text(recipe.mainInformation.description)
          .font(.subheadline)
          .padding()
        Spacer()
      }
        List {
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients.indices, id: \.self) { index in
                    let ingredient = recipe.ingredients[index]
                    Text(ingredient.description)
            }
        }
            Section(header: Text("Directions")) {
                ForEach(recipe.directions.indices, id: \.self) { index in
                    let direction = recipe.directions[index]
                    HStack {
                        Text("\(index + 1). ")
                            .bold()
                        Text("\(direction.isOptional ? "(Optional) " : " ")" + "\(direction.description)")
                    }
                }
        }

    }
    .navigationTitle(recipe.mainInformation.name)
  }
}
 
struct RecipeDetailView_Previews: PreviewProvider {
  @State static var recipe = Recipe.testRecipes[0]      //Recipe property that references the first test recipe - for visuals
  static var previews: some View {
    NavigationView {
      RecipeDetailView(recipe: recipe)
            }
        }
    }
}
