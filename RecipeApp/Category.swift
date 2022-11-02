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
    MealsCategory(img: UIImage(named: "c1")!, title: "Meat"),
    MealsCategory(img: UIImage(named: "c2")!, title: "Beaf"),
    MealsCategory(img: UIImage(named: "c3")!, title: "Food"),
    MealsCategory(img: UIImage(named: "c4")!, title: "Fish"),
    MealsCategory(img: UIImage(named: "c5")!, title: "Desert"),
    MealsCategory(img: UIImage(named: "c6")!, title: "Milk")
]
