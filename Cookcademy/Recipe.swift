//
//  Recipe.swift
//  Cookcademy
//
//  Created by Scott Rome on 5/26/22.
//

import Foundation


// Structures and Enummerations for the Recipes

struct Recipe {
    var mainInformation: MainInformation        //all three use another struct as its type
    var ingredients: [Ingredient]
    var directions: [Direction]
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category                      //enumeration used to keep the categories in set bounds
    
    enum Category: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}

struct Ingredient {
    var name: String
    var quantity: Double
    var unit: Unit
    
    var description: String {
        let formattedQuantity = String(format: "%g",quantity)       //Used to format quantity double into rational numbers
        switch unit {
        case .none:                                                 //if there is NO unit(enum)
            let formattedName = quantity == 1 ? name : "\(name)s"   //ternary operator if qty is equal to 1
            return "\(formattedQuantity) \(formattedName)"
        default:                                                    //if there is a unit(enum)
            if quantity == 1 {
                return "1 \(unit.singularName) \(name)"
            } else {
                return "\(formattedQuantity) \(unit.rawValue) \(name)"
            }
        }
    }
    
    enum Unit: String, CaseIterable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tps = "Teaspoons"
        case tbs = "Tablespoons"
        case none = "No units"
        
        var singularName: String {String(rawValue.dropLast())}
    }
}



struct Direction {
    var description: String
    var isOptional: Bool
}

