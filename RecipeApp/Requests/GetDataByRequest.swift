//
//  GetDataByRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import Foundation

func getMealOverviewData(completed: @escaping ()->() ){
    let getRandomMealRequestURL = URL( string: "https://www.themealdb.com/api/json/v1/1/random.php")
    guard let url = getRandomMealRequestURL else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                mealOverviewDataArr = try JSONDecoder().decode(MealStruct.self, from: newData1)
                DispatchQueue.main.async {
                    completed()
                }
            } catch (let error) {
                print("\n---> error: \(error)")
            }
        }
    }
    task.resume()
}
