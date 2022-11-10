//
//  IngredientsTableVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import UIKit

class IngredientsTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = self
        self.table.delegate = self
        
        let ingredientsListURL = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?i=list")
        
        getJSONIngredientsList(requestURL: ingredientsListURL!){
            self.table.reloadData()
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsListData.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = ingredientsListData.meals[indexPath.row].strIngredient

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let buffer = ingredientsListData.meals[indexPath.row].strIngredient
        
        let replaced = buffer.replacingOccurrences(of: " ", with: "%20")
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(replaced)"
        let url = URL( string: urlTemplate)
        
        getIngredientsRequest(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchIngredientVC") as? SearchIngredientVC
            vc?.output = mealsAtCategoryArr
            vc?.mainIngredient = buffer.lowercased()
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

var imgArr = [[UIImage]]()
var ttt = UIImage(named: "ingredient.png")

func ingIMG(input: URL,completed: @escaping ()->() ){
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: input){ (data, response, error )in
        guard let data = data, error == nil else {
            return
        }
        ttt = UIImage(data: data)
        DispatchQueue.main.async{
            completed()
        }
    }
    task.resume()
}
