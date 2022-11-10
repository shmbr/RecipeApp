//
//  SearchIngredientVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 08.11.2022.
//

import UIKit

class SearchIngredientVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var output = CategoryStruct(meals: [])
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(output.meals[indexPath.row].strMeal)
        let replaced = output.meals[indexPath.row].strMeal.replacingOccurrences(of: " ", with: "%20")
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(replaced)"
        let url = URL( string: urlTemplate)
        
        getMealRequest(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.mealToDisplay = meal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
