//
//  AreaOverwievVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class AreaOverwievVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    
    let templateStringURL = "https://www.themealdb.com/api/json/v1/1/filter.php?a="
        
    var areaName = ""
    var areaFlag = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        getFilteredDataRequest(testURl: URL( string: templateStringURL + areaName)!){
            self.nameLabel.text = self.areaName
            self.flagLabel.text = self.areaFlag
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDataArr.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = filteredDataArr.meals[indexPath.row].strMeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requestParameter = filteredDataArr.meals[indexPath.row].strMeal.replacingOccurrences(of: " ", with: "%20")
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(requestParameter)"
        let url = URL( string: urlString)
        getMealRequest(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.mealToDisplay = meal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
