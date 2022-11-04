//
//  CategoryTableData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

struct CategoryTableData: Codable{
    let meals: [CategoryData]
}

struct CategoryData: Codable {
    let strMeal: String
    let strMealThumb: String
}
