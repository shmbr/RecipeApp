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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
