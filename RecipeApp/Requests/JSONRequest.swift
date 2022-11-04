//
//  JSONRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

var mealsAtCategoryArr = CategoryTableData(meals: [])
var areaTableArr = CategoryTableData(meals: [])
var ingredientsListData = IngredientsList(meals: [])

func getJSON(requestURL: URL, completed: @escaping ()->() ){
    
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                mealsAtCategoryArr = try JSONDecoder().decode(CategoryTableData.self, from: data!)
            }catch{
                print("api error getting category meals!")
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}

func getJSONArea(requestURL: URL, completed: @escaping ()->() ){
    
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                areaTableArr = try JSONDecoder().decode(CategoryTableData.self, from: data!)
            }catch{
                print("api error getting area meals!")
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}

func getJSONIngredientsList(requestURL: URL, completed: @escaping ()->() ){
    
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                ingredientsListData = try JSONDecoder().decode(IngredientsList.self, from: data!)
            }catch{
                print("api error getting ingredients list!")
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}
