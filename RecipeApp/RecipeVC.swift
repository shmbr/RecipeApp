//
//  RecipeVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class RecipeVC: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var recipe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = recipe
    }
}
