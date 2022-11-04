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
        
        
        getJSONArea(requestURL: URL( string: templateStringURL + areaName)!){
            self.nameLabel.text = self.areaName
            self.flagLabel.text = self.areaFlag
            
            self.table.reloadData()
            self.table.tintColor = UIColor(named: "red")
        }
        table.largeContentTitle = "fmw0ef"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaTableArr.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let meal = areaTableArr.meals[indexPath.row]
        cell.textLabel?.text = meal.strMeal
        return cell
    }
}
