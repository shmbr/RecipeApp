//
//  FavouriteVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import UIKit

class FavouriteVC: UIViewController {

    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var table: UITableView!
    
    @IBAction func button(_ sender: Any) {
        self.heart.isHidden = !self.heart.isHidden
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
