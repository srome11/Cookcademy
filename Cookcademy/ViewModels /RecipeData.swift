//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Scott Rome on 6/1/22.
//

import Foundation


class RecipeData: ObservableObject {                //Conform to ObserservableObject because its a class. Monitors when @pub                                                            propteries change
    @Published var recipes = Recipe.testRecipes     //Any changes to Recipe (model) will be published
}
