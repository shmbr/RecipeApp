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
        return 19
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        if (mealArr.meals[0].strIngredient1 != nil) && (mealArr.meals[0].strMeasure1 != nil){
            newArr.append([mealArr.meals[0].strIngredient1!, mealArr.meals[0].strMeasure1!])
        }
        if (mealArr.meals[0].strIngredient2 != nil) && (mealArr.meals[0].strMeasure2 != nil){
            newArr.append([mealArr.meals[0].strIngredient2!, mealArr.meals[0].strMeasure2!])
        }
        if (mealArr.meals[0].strIngredient3 != nil) && (mealArr.meals[0].strMeasure3 != nil){
            newArr.append([mealArr.meals[0].strIngredient3!, mealArr.meals[0].strMeasure3!])
        }
        if (mealArr.meals[0].strIngredient4 != nil) && (mealArr.meals[0].strMeasure4 != nil){
            newArr.append([mealArr.meals[0].strIngredient4!, mealArr.meals[0].strMeasure4!])
        }
        if (mealArr.meals[0].strIngredient5 != nil) && (mealArr.meals[0].strMeasure5 != nil){
            newArr.append([mealArr.meals[0].strIngredient5!, mealArr.meals[0].strMeasure5!])
        }
        if (mealArr.meals[0].strIngredient6 != nil) && (mealArr.meals[0].strMeasure6 != nil){
            newArr.append([mealArr.meals[0].strIngredient6!, mealArr.meals[0].strMeasure6!])
        }
        if (mealArr.meals[0].strIngredient7 != nil) && (mealArr.meals[0].strMeasure7 != nil){
            newArr.append([mealArr.meals[0].strIngredient7!, mealArr.meals[0].strMeasure7!])
        }
        if (mealArr.meals[0].strIngredient8 != nil) && (mealArr.meals[0].strMeasure8 != nil){
            newArr.append([mealArr.meals[0].strIngredient8!, mealArr.meals[0].strMeasure8!])
        }
        if (mealArr.meals[0].strIngredient9 != nil) && (mealArr.meals[0].strMeasure9 != nil){
            newArr.append([mealArr.meals[0].strIngredient9!, mealArr.meals[0].strMeasure9!])
        }
        if (mealArr.meals[0].strIngredient10 != nil) && (mealArr.meals[0].strMeasure10 != nil){
            newArr.append([mealArr.meals[0].strIngredient10!, mealArr.meals[0].strMeasure10!])
        }
        if (mealArr.meals[0].strIngredient11 != nil) && (mealArr.meals[0].strMeasure11 != nil){
            newArr.append([mealArr.meals[0].strIngredient11!, mealArr.meals[0].strMeasure11!])
        }
        if (mealArr.meals[0].strIngredient12 != nil) && (mealArr.meals[0].strMeasure12 != nil){
            newArr.append([mealArr.meals[0].strIngredient12!, mealArr.meals[0].strMeasure12!])
        }
        if (mealArr.meals[0].strIngredient13 != nil) && (mealArr.meals[0].strMeasure13 != nil){
            newArr.append([mealArr.meals[0].strIngredient13!, mealArr.meals[0].strMeasure13!])
        }
        if (mealArr.meals[0].strIngredient14 != nil) && (mealArr.meals[0].strMeasure14 != nil){
            newArr.append([mealArr.meals[0].strIngredient15!, mealArr.meals[0].strMeasure14!])
        }
        if (mealArr.meals[0].strIngredient15 != nil) && (mealArr.meals[0].strMeasure15 != nil){
            newArr.append([mealArr.meals[0].strIngredient15!, mealArr.meals[0].strMeasure15!])
        }
        if (mealArr.meals[0].strIngredient16 != nil) && (mealArr.meals[0].strMeasure16 != nil){
            newArr.append([mealArr.meals[0].strIngredient16!, mealArr.meals[0].strMeasure16!])
        }
        if (mealArr.meals[0].strIngredient17 != nil) && (mealArr.meals[0].strMeasure17 != nil){
            newArr.append([mealArr.meals[0].strIngredient17!, mealArr.meals[0].strMeasure17!])
        }
        if (mealArr.meals[0].strIngredient18 != nil) && (mealArr.meals[0].strMeasure18 != nil){
            newArr.append([mealArr.meals[0].strIngredient18!, mealArr.meals[0].strMeasure18!])
        }
        if (mealArr.meals[0].strIngredient19 != nil) && (mealArr.meals[0].strMeasure19 != nil){
            newArr.append([mealArr.meals[0].strIngredient19!, mealArr.meals[0].strMeasure19!])
        }
        if (mealArr.meals[0].strIngredient20 != nil) && (mealArr.meals[0].strMeasure20 != nil){
            newArr.append([mealArr.meals[0].strIngredient20!, mealArr.meals[0].strMeasure20!])
        }
                
        cell.textLabel?.text = newArr[indexPath.row][0]
        cell.detailTextLabel?.text = newArr[indexPath.row][1]
        return cell
    }
}

//        newArr.append([mealArr.meals[0].strIngredient1!, mealArr.meals[0].strMeasure1!]
//        newArr.append([mealArr.meals[0].strIngredient2!, mealArr.meals[0].strMeasure2!])
//        newArr.append([mealArr.meals[0].strIngredient3!, mealArr.meals[0].strMeasure3!])
//        newArr.append([mealArr.meals[0].strIngredient4!, mealArr.meals[0].strMeasure4!])
//        newArr.append([mealArr.meals[0].strIngredient5!, mealArr.meals[0].strMeasure5!])
//        newArr.append([mealArr.meals[0].strIngredient6!, mealArr.meals[0].strMeasure6!])
//        newArr.append([mealArr.meals[0].strIngredient7!, mealArr.meals[0].strMeasure7!])
//        newArr.append([mealArr.meals[0].strIngredient8!, mealArr.meals[0].strMeasure8!])
//        newArr.append([mealArr.meals[0].strIngredient9!, mealArr.meals[0].strMeasure9!])
//        newArr.append([mealArr.meals[0].strIngredient10!, mealArr.meals[0].strMeasure10!])
//        newArr.append([mealArr.meals[0].strIngredient11!, mealArr.meals[0].strMeasure11!])
//        newArr.append([mealArr.meals[0].strIngredient12!, mealArr.meals[0].strMeasure12!])
//        newArr.append([mealArr.meals[0].strIngredient13!, mealArr.meals[0].strMeasure13!])
//        newArr.append([mealArr.meals[0].strIngredient14!, mealArr.meals[0].strMeasure14!])
//        newArr.append([mealArr.meals[0].strIngredient15!, mealArr.meals[0].strMeasure15!])
//        newArr.append([mealArr.meals[0].strIngredient16!, mealArr.meals[0].strMeasure16!])
//        newArr.append([mealArr.meals[0].strIngredient17!, mealArr.meals[0].strMeasure17!])
//        newArr.append([mealArr.meals[0].strIngredient18!, mealArr.meals[0].strMeasure18!])
//        newArr.append([mealArr.meals[0].strIngredient19!, mealArr.meals[0].strMeasure19!])
//        newArr.append([mealArr.meals[0].strIngredient20!, mealArr.meals[0].strMeasure20!])
        
//
//            if (mealArr.meals[0].strIngredient1 != ") && (mealArr.meals[0].strMeasure1! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient1!, mealArr.meals[0].strMeasure1!])
//            }
//            if (mealArr.meals[0].strIngredient2 != "null") && (mealArr.meals[0].strMeasure2! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient2!, mealArr.meals[0].strMeasure2!])
//            }
//            if (mealArr.meals[0].strIngredient3 != "null") && (mealArr.meals[0].strMeasure3! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient3!, mealArr.meals[0].strMeasure3!])
//            }
//            if (mealArr.meals[0].strIngredient4 != "null") && (mealArr.meals[0].strMeasure4! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient4!, mealArr.meals[0].strMeasure4!])
//            }
//            if (mealArr.meals[0].strIngredient5 != "null") && (mealArr.meals[0].strMeasure5! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient5!, mealArr.meals[0].strMeasure5!])
//            }
//
//            if (mealArr.meals[0].strIngredient6 != "null") && (mealArr.meals[0].strMeasure6! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient6!, mealArr.meals[0].strMeasure6!])
//            }
//            if (mealArr.meals[0].strIngredient7 != "null") && (mealArr.meals[0].strMeasure7! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient7!, mealArr.meals[0].strMeasure7!])
//            }
//            if (mealArr.meals[0].strIngredient8 != "null") && (mealArr.meals[0].strMeasure8! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient8!, mealArr.meals[0].strMeasure8!])
//            }
//            if (mealArr.meals[0].strIngredient9 != "null") && (mealArr.meals[0].strMeasure9! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient9!, mealArr.meals[0].strMeasure9!])
//            }
//            if (mealArr.meals[0].strIngredient10 != "null") && (mealArr.meals[0].strMeasure10! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient10!, mealArr.meals[0].strMeasure10!])
//            }
//
//            if (mealArr.meals[0].strIngredient11 != "null") && (mealArr.meals[0].strMeasure11! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient11!, mealArr.meals[0].strMeasure11!])
//            }
//            if (mealArr.meals[0].strIngredient12 != nil) && (mealArr.meals[0].strMeasure12! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient12!, mealArr.meals[0].strMeasure12!])
//            }
//            if (mealArr.meals[0].strIngredient13 != "null") && (mealArr.meals[0].strMeasure13! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient13!, mealArr.meals[0].strMeasure13!])
//            }
//            if (mealArr.meals[0].strIngredient14 != "null") && (mealArr.meals[0].strMeasure14! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient15!, mealArr.meals[0].strMeasure14!])
//            }
//            if (mealArr.meals[0].strIngredient15 != "null") && (mealArr.meals[0].strMeasure15! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient15!, mealArr.meals[0].strMeasure15!])
//            }
//
//            if (mealArr.meals[0].strIngredient16 != "null") && (mealArr.meals[0].strMeasure16! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient16!, mealArr.meals[0].strMeasure16!])
//            }
//            if (mealArr.meals[0].strIngredient17 != "null") && (mealArr.meals[0].strMeasure17! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient17!, mealArr.meals[0].strMeasure17!])
//            }
//            if (mealArr.meals[0].strIngredient18 != "null") && (mealArr.meals[0].strMeasure18! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient18!, mealArr.meals[0].strMeasure18!])
//            }
//            if (mealArr.meals[0].strIngredient19 != "null") && (mealArr.meals[0].strMeasure19! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient19!, mealArr.meals[0].strMeasure19!])
//            }
//            if (mealArr.meals[0].strIngredient20 != "null") && (mealArr.meals[0].strMeasure20! != "null"){
//                newArr.append([mealArr.meals[0].strIngredient20!, mealArr.meals[0].strMeasure20!])
//            }
