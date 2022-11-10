//
//  JSONRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

var mealsAtCategoryArr = CategoryStruct(meals: [])
var areaTableArr = CategoryStruct(meals: [])
var ingredientsListData = IngredientStruct(meals: [])

func getJSON(requestURL: URL, completed: @escaping ()->() ){
    
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                mealsAtCategoryArr = try JSONDecoder().decode(CategoryStruct.self, from: data!)
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
                areaTableArr = try JSONDecoder().decode(CategoryStruct.self, from: data!)
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



func getMealRequest(testURl: URL?, completed: @escaping ()->()){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){ data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                meal = try JSONDecoder().decode(MealStruct.self, from: newData1)
                DispatchQueue.main.async {
                    completed()
                }
            } catch (let error) {
                meal = MealStruct(meals: [])
                print("\n---> error: \(error)")
                err = "error"
                DispatchQueue.main.async {
                    completed()
                }
            }
        }
    }
    task.resume()
}

func getIngredientsRequest(testURl: URL?, completed: @escaping ()->() ){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                mealsAtCategoryArr = try JSONDecoder().decode(CategoryStruct.self, from: newData1)
                DispatchQueue.main.async {
                    completed()
                }
            } catch (let error) {
                print("\n---> error: \(error)")
                err = "error"
                DispatchQueue.main.async {
                    completed()
                }
            }
        }
    }
    task.resume()
}

