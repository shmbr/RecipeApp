//
//  TestRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 09.11.2022.
//

import Foundation

func testRequest(testURl: URL?, completed: @escaping ()->() ){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){ data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                searchMealOverviewDataArr = try JSONDecoder().decode(Meals.self, from: newData1)
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
