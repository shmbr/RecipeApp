//
//  Category.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import Foundation
import UIKit

struct MealsCategory{
    let img: UIImage
    let title: String
}

let categoriesData: [MealsCategory] = [
    MealsCategory(img: UIImage(named: "category_img_1.png")!, title: "Vegetarian"),
    MealsCategory(img: UIImage(named: "category_img_2.png")!, title: "Side"),
    MealsCategory(img: UIImage(named: "category_img_3.png")!, title: "Vegan"),
    MealsCategory(img: UIImage(named: "category_img_4.png")!, title: "Starter"),
    MealsCategory(img: UIImage(named: "category_img_5.png")!, title: "Miscellaneous"),
    MealsCategory(img: UIImage(named: "category_img_6.png")!, title: "Dessert"),
    MealsCategory(img: UIImage(named: "category_img_7.png")!, title: "Pasta"),
    MealsCategory(img: UIImage(named: "category_img_8.png")!, title: "Breakfast"),
    MealsCategory(img: UIImage(named: "category_img_9.png")!, title: "Lamb"),
    MealsCategory(img: UIImage(named: "category_img_10.png")!, title: "Beef"),
    MealsCategory(img: UIImage(named: "category_img_11.png")!, title: "Chicken"),
    MealsCategory(img: UIImage(named: "category_img_12.png")!, title: "Pork"),
    MealsCategory(img: UIImage(named: "category_img_13.png")!, title: "Seafood"),
    MealsCategory(img: UIImage(named: "category_img_14.png")!, title: "Goat")
]
