//
//  GetRandomMealVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 01.11.2022.
//

import UIKit

class GetRandomMealVC: UIViewController {

    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "toMealOverwiev", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
