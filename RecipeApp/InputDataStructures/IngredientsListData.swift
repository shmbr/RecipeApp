//
//  IngredientsListData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import Foundation

struct IngredientsList: Codable{
    let meals: [Ingredient]
}

struct Ingredient: Codable {
    let strIngredient: String
}
