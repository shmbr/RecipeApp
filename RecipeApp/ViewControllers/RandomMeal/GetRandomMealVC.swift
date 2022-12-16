//
//  GetRandomMealVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

class GetRandomMealVC: UIViewController {

    @IBAction func button(_ sender: Any) {
        getMealRequest(testURl: URL( string: "https://www.themealdb.com/api/json/v1/1/random.php")){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.mealToDisplay = meal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
