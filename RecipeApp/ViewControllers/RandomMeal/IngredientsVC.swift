//
//  IngridientsVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class IngridientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    var ingredients = MealStruct(meals: [])
    var ingredientsUnwrapped = [[String]]()
    
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
        
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient1 ?? ""), ingredients.meals[0].strMeasure1 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient2 ?? ""), ingredients.meals[0].strMeasure2 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient3 ?? ""), ingredients.meals[0].strMeasure3 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient4 ?? ""), ingredients.meals[0].strMeasure4 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient5 ?? ""), ingredients.meals[0].strMeasure5 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient6 ?? ""), ingredients.meals[0].strMeasure6 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient7 ?? ""), ingredients.meals[0].strMeasure7 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient8 ?? ""), ingredients.meals[0].strMeasure8 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient9 ?? ""), ingredients.meals[0].strMeasure9 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient10 ?? ""), ingredients.meals[0].strMeasure10 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient11 ?? ""), ingredients.meals[0].strMeasure11 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient12 ?? ""), ingredients.meals[0].strMeasure12 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient13 ?? ""), ingredients.meals[0].strMeasure13 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient14 ?? ""), ingredients.meals[0].strMeasure14 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient15 ?? ""), ingredients.meals[0].strMeasure15 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient16 ?? ""), ingredients.meals[0].strMeasure16 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient17 ?? ""), ingredients.meals[0].strMeasure17 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient18 ?? ""), ingredients.meals[0].strMeasure18 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient19 ?? ""), ingredients.meals[0].strMeasure19 ?? ""])
        ingredientsUnwrapped.append([(ingredients.meals[0].strIngredient20 ?? ""), ingredients.meals[0].strMeasure20 ?? ""])
        
        cell.textLabel?.text = ingredientsUnwrapped[indexPath.row][0]
        cell.detailTextLabel?.text = ingredientsUnwrapped[indexPath.row][1]
        return cell
    }
}
