//
//  IngridientsVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class IngridientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    var mealArr = Meals(meals: [])
    var newArr = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        newArr.append([(mealArr.meals[0].strIngredient1 ?? ""), mealArr.meals[0].strMeasure1 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient2 ?? ""), mealArr.meals[0].strMeasure2 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient3 ?? ""), mealArr.meals[0].strMeasure3 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient4 ?? ""), mealArr.meals[0].strMeasure4 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient5 ?? ""), mealArr.meals[0].strMeasure5 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient6 ?? ""), mealArr.meals[0].strMeasure6 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient7 ?? ""), mealArr.meals[0].strMeasure7 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient8 ?? ""), mealArr.meals[0].strMeasure8 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient9 ?? ""), mealArr.meals[0].strMeasure9 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient10 ?? ""), mealArr.meals[0].strMeasure10 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient11 ?? ""), mealArr.meals[0].strMeasure11 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient12 ?? ""), mealArr.meals[0].strMeasure12 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient13 ?? ""), mealArr.meals[0].strMeasure13 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient14 ?? ""), mealArr.meals[0].strMeasure14 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient15 ?? ""), mealArr.meals[0].strMeasure15 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient16 ?? ""), mealArr.meals[0].strMeasure16 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient17 ?? ""), mealArr.meals[0].strMeasure17 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient18 ?? ""), mealArr.meals[0].strMeasure18 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient19 ?? ""), mealArr.meals[0].strMeasure19 ?? ""])
        newArr.append([(mealArr.meals[0].strIngredient20 ?? ""), mealArr.meals[0].strMeasure20 ?? ""])
        
        cell.textLabel?.text = newArr[indexPath.row][0]
        cell.detailTextLabel?.text = newArr[indexPath.row][1]
        return cell
    }
}
