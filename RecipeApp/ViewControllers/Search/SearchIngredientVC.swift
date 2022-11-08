//
//  SearchIngredientVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 08.11.2022.
//

import UIKit

class SearchIngredientVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var output = CategoryTableData(meals: [])
    var mainIngredient = ""
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        label.text = "Meals, where \(mainIngredient) main ingredient"

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = output.meals[indexPath.row].strMeal
        return cell
    }
    
}
