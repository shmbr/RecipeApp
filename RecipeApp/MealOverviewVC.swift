//
//  ViewController.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

class MealOverviewVC: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func ingredientsButton(_ sender: Any) {
        performSegue(withIdentifier: "toIngredientsScreen", sender: nil)
    }
    @IBAction func recipeButton(_ sender: Any) {
        performSegue(withIdentifier: "toRecipeScreen", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.image.image = mealOverwiewImg
        
        getMealOverviewData(){
            self.namelabel.text = mealOverviewDataArr.meals[0].strMeal
            self.categoryLabel.text = String("Category - " + mealOverviewDataArr.meals[0].strCategory)
            self.areaLabel.text = String("Area - " + mealOverviewDataArr.meals[0].strArea)
            
            guard let imgURL = URL(string: mealOverviewDataArr.meals[0].strMealThumb) else {
                fatalError("Broken IMG Link!")
            }
            
            requestImgByUrl(input: imgURL){
                self.image.image = mealOverwiewImg
            }
        }
    }
}
