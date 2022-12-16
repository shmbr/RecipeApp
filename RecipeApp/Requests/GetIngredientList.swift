//
//  GetIngredientList.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 15.12.2022.
//

import Foundation

var ingredientsListData = IngredientStruct(meals: [])

func getIngredientsListRequest(requestURL: URL, completed: @escaping ()->() ){
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                ingredientsListData = try JSONDecoder().decode(IngredientStruct.self, from: data!)
            }catch{
                print("api error getting ingredients list!")
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}
