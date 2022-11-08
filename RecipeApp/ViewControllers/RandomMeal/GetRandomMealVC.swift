//
//  GetRandomMealVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

class GetRandomMealVC: UIViewController {

    @IBAction func button(_ sender: Any) {
        getMealOverviewData(){
            //self.performSegue(withIdentifier: "toMealOverwiev", sender: nil)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.display = mealOverviewDataArr
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
