//
//  ImgRequest.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 16.11.2022.
//

import Foundation
import UIKit

var mealOverwiewImg = UIImage(named: "food-tray.png")

func requestImgByUrl(input: URL,completed: @escaping ()->() ){
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: input){ (data, response, error )in
        guard let data = data, error == nil else {
            return
        }
        mealOverwiewImg = UIImage(data: data)
        DispatchQueue.main.async{
            completed()
        }
    }
    task.resume()
}
