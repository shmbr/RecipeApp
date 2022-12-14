//
//  ViewController.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

var meal = MealStruct(meals: [])
var mealOverviewDataArr = MealStruct(meals: [])
var mealOverwiewImg = UIImage(named: "food-tray.png")

class MealOverviewVC: UIViewController {
    
    var mealToDisplay = MealStruct(meals: [])
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func ingredientsButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "IngridientsVC") as? IngridientsVC
        vc?.meal = mealToDisplay
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func recipeButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeVC") as? RecipeVC
        vc?.recipe = mealToDisplay.meals[0].strInstructions
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = mealToDisplay.meals[0].strMeal
        self.categoryLabel.text = String("Category - " + mealToDisplay.meals[0].strCategory)
        self.areaLabel.text = String("Area - " + mealToDisplay.meals[0].strArea)
        
        guard let imgURL = URL(string: mealToDisplay.meals[0].strMealThumb) else {
            fatalError("\n---> error: Broken IMG Link!")
        }

        requestImgByUrl(input: imgURL){
            self.image.image = mealOverwiewImg
        }
    }
}
