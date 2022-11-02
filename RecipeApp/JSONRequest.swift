//
//  JSONRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation

func getJSON(requestURL: URL, completed: @escaping ()->() ){
    
    URLSession.shared.dataTask(with: requestURL) {data, response, error in
        if error == nil{
            do{
                mealsAtCategoryArr = try JSONDecoder().decode(CategoryTableData.self, from: data!)
            }catch{
                print("api error get category meals !")
                
            }
            DispatchQueue.main.async {
                completed()
            }
        }
    }.resume()
}
