//
//  CategoryTableData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

// https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood

var mealsAtCategoryArr = CategoryTableData(meals: [])

struct CategoryTableData: Codable{
    let meals: [CategoryData]
}

struct CategoryData: Codable {
    let strMeal: String
    let strMealThumb: String
}

