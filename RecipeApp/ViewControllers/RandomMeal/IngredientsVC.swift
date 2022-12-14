//
//  IngridientsVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class IngridientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    ///////////////////////////////////////////////////////////////////////////////////
    //!!!!!
    var meal = MealStruct(meals: [])
    //var meal = mealOverviewDataArr
    ///////////////////////////////////////////////////////////////////////////////////
    
    var ingredientsUnwrappedArr = [[String]]()
    
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
        
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient1 ?? ""), meal.meals[0].strMeasure1 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient2 ?? ""), meal.meals[0].strMeasure2 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient3 ?? ""), meal.meals[0].strMeasure3 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient4 ?? ""), meal.meals[0].strMeasure4 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient5 ?? ""), meal.meals[0].strMeasure5 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient6 ?? ""), meal.meals[0].strMeasure6 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient7 ?? ""), meal.meals[0].strMeasure7 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient8 ?? ""), meal.meals[0].strMeasure8 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient9 ?? ""), meal.meals[0].strMeasure9 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient10 ?? ""), meal.meals[0].strMeasure10 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient11 ?? ""), meal.meals[0].strMeasure11 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient12 ?? ""), meal.meals[0].strMeasure12 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient13 ?? ""), meal.meals[0].strMeasure13 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient14 ?? ""), meal.meals[0].strMeasure14 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient15 ?? ""), meal.meals[0].strMeasure15 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient16 ?? ""), meal.meals[0].strMeasure16 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient17 ?? ""), meal.meals[0].strMeasure17 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient18 ?? ""), meal.meals[0].strMeasure18 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient19 ?? ""), meal.meals[0].strMeasure19 ?? ""])
        ingredientsUnwrappedArr.append([(meal.meals[0].strIngredient20 ?? ""), meal.meals[0].strMeasure20 ?? ""])
        
        cell.textLabel?.text = ingredientsUnwrappedArr[indexPath.row][0]
        cell.detailTextLabel?.text = ingredientsUnwrappedArr[indexPath.row][1]
        return cell
    }
}
