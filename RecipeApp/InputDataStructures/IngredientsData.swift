//
//  IngredientsListData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import Foundation

struct IngredientStruct: Codable{
    let meals: [IngredientJSONData]
}

struct IngredientJSONData: Codable {
    let strIngredient: String
}
