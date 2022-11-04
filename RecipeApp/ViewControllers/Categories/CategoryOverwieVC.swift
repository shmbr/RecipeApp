//
//  CategoryOverwieVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import UIKit

class CategoryOverwieVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    let templateStringURL = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    var categoryName = ""
    var categoryImg = UIImage(named: "sauce")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self

        getJSON(requestURL: URL( string: templateStringURL + categoryName)!){
            self.table.reloadData()
            self.label.text = self.categoryName
            self.image.image = self.categoryImg
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsAtCategoryArr.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let meal = mealsAtCategoryArr.meals[indexPath.row]
        cell.textLabel?.text = meal.strMeal
        return cell
    }
}

