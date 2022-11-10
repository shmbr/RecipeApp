//
//  CategoryTableData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

struct CategoryStruct: Codable{
    let meals: [CategoryInputJSONData]
}

struct CategoryInputJSONData: Codable {
    let strMeal: String
    let strMealThumb: String
}
