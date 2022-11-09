//
//  ViewController.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

class MealOverviewVC: UIViewController {
    
    var display = Meals(meals: [])
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func ingredientsButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "IngridientsVC") as? IngridientsVC
        vc?.mealArr = display
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func recipeButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeVC") as? RecipeVC
        vc?.recipe = display.meals[0].strInstructions
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.namelabel.text = display.meals[0].strMeal
        self.categoryLabel.text = String("Category - " + display.meals[0].strCategory)
        self.areaLabel.text = String("Area - " + display.meals[0].strArea)
        
        guard let imgURL = URL(string: display.meals[0].strMealThumb) else {
            fatalError("Broken IMG Link!")
        }
        
        requestImgByUrl(input: imgURL){
            self.image.image = mealOverwiewImg
        }
    }
}
