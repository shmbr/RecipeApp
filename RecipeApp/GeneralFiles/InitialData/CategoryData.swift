//
//  Category.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation
import UIKit

struct CategoriesDataStruct{
    let img: UIImage
    let title: String
}

let categories: [CategoriesDataStruct] = [
    CategoriesDataStruct(img: UIImage(named: "category_img_1.png")!, title: "Vegetarian"),
    CategoriesDataStruct(img: UIImage(named: "category_img_2.png")!, title: "Side"),
    CategoriesDataStruct(img: UIImage(named: "category_img_3.png")!, title: "Vegan"),
    CategoriesDataStruct(img: UIImage(named: "category_img_4.png")!, title: "Starter"),
    CategoriesDataStruct(img: UIImage(named: "category_img_5.png")!, title: "Miscellaneous"),
    CategoriesDataStruct(img: UIImage(named: "category_img_6.png")!, title: "Dessert"),
    CategoriesDataStruct(img: UIImage(named: "category_img_7.png")!, title: "Pasta"),
    CategoriesDataStruct(img: UIImage(named: "category_img_8.png")!, title: "Breakfast"),
    CategoriesDataStruct(img: UIImage(named: "category_img_9.png")!, title: "Lamb"),
    CategoriesDataStruct(img: UIImage(named: "category_img_10.png")!, title: "Beef"),
    CategoriesDataStruct(img: UIImage(named: "category_img_11.png")!, title: "Chicken"),
    CategoriesDataStruct(img: UIImage(named: "category_img_12.png")!, title: "Pork"),
    CategoriesDataStruct(img: UIImage(named: "category_img_13.png")!, title: "Seafood"),
    CategoriesDataStruct(img: UIImage(named: "category_img_14.png")!, title: "Goat")
]
