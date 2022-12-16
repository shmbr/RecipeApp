//
//  GetFilteredData.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

var filteredDataArr = CategoryStruct(meals: [])

func getFilteredDataRequest(testURl: URL?, completed: @escaping ()->() ){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                filteredDataArr = try JSONDecoder().decode(CategoryStruct.self, from: newData1)
                DispatchQueue.main.async {
                    completed()
                }
            } catch (let error) {
                print("\n---> error: \(error)")
                err = "error"
            }
        }
    }
    task.resume()
}
