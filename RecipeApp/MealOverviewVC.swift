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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.image = UIImage(named: "food-tray.png")
        
        getMealOverviewData(){
            self.namelabel.text = mealOverviewDataArr.meals[0].strMeal
            self.categoryLabel.text = String("Category - " + mealOverviewDataArr.meals[0].strCategory)
            self.areaLabel.text = String("Area - " +
                mealOverviewDataArr.meals[0].strArea)
            
            guard let imgURL = URL(string: mealOverviewDataArr.meals[0].strMealThumb) else {
                fatalError("Broken IMG Link!")
            }
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: imgURL){ (data, response, error )in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async{
                    self.image.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
