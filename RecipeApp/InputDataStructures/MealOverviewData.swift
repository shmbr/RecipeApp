//
//  MealPageData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import Foundation

struct Meals: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strMealThumb: String
    let strInstructions: String
}
