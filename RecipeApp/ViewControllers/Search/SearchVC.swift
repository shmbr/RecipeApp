//
//  SearchVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var completeNameTF: UITextField!
    @IBOutlet weak var dishesStartedAtTF: UITextField!
    @IBOutlet weak var dishesByMainIngredientTF: UITextField!
    
    @IBAction func completeNameButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
        vc?.strInput = completeNameTF.text ?? "no data"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func dishesStartedAtButton(_ sender: Any) {
    }
    @IBAction func dishesByMainIngredientButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
