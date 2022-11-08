//
//  SearchVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import UIKit

var searchMealOverviewDataArr = Meals(meals: [])

class SearchVC: UIViewController {
    
    @IBAction func begin1(_ sender: Any) {
        view1.layer.borderWidth = 5
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor
    }
    @IBAction func end1(_ sender: Any) {
        view1.layer.borderWidth = 0
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
    }
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var completeNameTF: UITextField!
    @IBOutlet weak var completeNameButton: UIButton!
    @IBOutlet weak var completeNameErrorLabel: UILabel!
    
    @IBAction func completeNameChanged(_ sender: Any) {
        
//        view1.layer.borderWidth = 5
//        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor
//
        if let name = completeNameTF.text
        {
            if let errorMessage = invalidCompleteName(name)
            {
                completeNameErrorLabel.text = errorMessage
                completeNameErrorLabel.isHidden = false
                completeNameButton.isEnabled = false
            }
            else
            {
                completeNameErrorLabel.isHidden = true
                completeNameButton.isEnabled = true
            }
        }
    }
    
    func invalidCompleteName(_ value: String) -> String?
    {
        if value.count > 10
        {
            return "Name must be < 10"
        }
        return nil
    }
    
    @IBAction func completeNameButton(_ sender: Any) {
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(completeNameTF.text ?? "")"
        let url = URL( string: urlTemplate)
        
        testRequest(testURl: url){
            //print(searchMealOverviewDataArr.meals[0].strMeal)
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
            vc?.strInput = searchMealOverviewDataArr.meals[0].strMeal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    
    @IBOutlet weak var startedAtTF: UITextField!
    @IBOutlet weak var startedAtButton: UIButton!
    @IBOutlet weak var startedAtErrorLabel: UILabel!
    
    @IBAction func startedAtChanged(_ sender: Any) {
        
        view2.layer.borderWidth = 5
        view2.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor
        
        
        if let startedAt = startedAtTF.text
        {
            if let errorMessage = invalidStartedAt(startedAt)
            {
                startedAtErrorLabel.text = errorMessage
                startedAtErrorLabel.isHidden = false
                startedAtButton.isEnabled = false
            }
            else
            {
                startedAtErrorLabel.isHidden = true
                startedAtButton.isEnabled = true
            }
        }
    }
    
    @IBAction func startedAtButton(_ sender: Any) {
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(startedAtTF.text ?? "")"
        let url = URL( string: urlTemplate)
        
        testRequest(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
            vc?.strInput = searchMealOverviewDataArr.meals[0].strMeal
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    func invalidStartedAt(_ value: String) -> String?
    {
        if value.count != 1
        {
            return "Only one symbol!"
        }
        return nil
    }
    
    @IBOutlet weak var mainIngredientTF: UITextField!
    @IBOutlet weak var mainIngredientButton: UIButton!
    @IBOutlet weak var mainIngredientErrorLabel: UILabel!
    
    @IBAction func clear(_ sender: Any) {
        view1.layer.borderWidth = 0
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
        
        view2.layer.borderWidth = 0
        view2.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
        
        view3.layer.borderWidth = 0
        view3.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
        
    }
    @IBAction func mainIngredientChanged(_ sender: Any) {
    
        view3.layer.borderWidth = 5
        view3.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor
        
        if let mainIngredient = mainIngredientTF.text
        {
            if let errorMessage = invalidMainIngredient(mainIngredient)
            {
                mainIngredientErrorLabel.text = errorMessage
                mainIngredientErrorLabel.isHidden = false
                mainIngredientButton.isEnabled = false
            }
            else
            {
                mainIngredientErrorLabel.isHidden = true
                mainIngredientButton.isEnabled = true
            }
        }
    }
    
    @IBAction func mainIngredientButton(_ sender: Any) {
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(mainIngredientTF.text ?? "")"
        let url = URL( string: urlTemplate)
        
        getJSON(requestURL: url!){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
            vc?.strInput = mealsAtCategoryArr.meals[0].strMeal
            
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        resetForm()
    }
    
    func invalidMainIngredient(_ value: String) -> String?
    {
        if value.count > 10
        {
            return " < 10 !"
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    }
    
    func resetForm(){
        completeNameButton.isEnabled = false
        completeNameErrorLabel.text = ""
        completeNameErrorLabel.isHidden = true
        
        startedAtButton.isEnabled = false
        startedAtErrorLabel.text = ""
        startedAtErrorLabel.isHidden = true
        
        mainIngredientButton.isEnabled = false
        mainIngredientErrorLabel.text = ""
        mainIngredientErrorLabel.isHidden = true
        
        view1.layer.borderWidth = 0
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor

        view2.layer.borderWidth = 0
        view2.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
        
        view3.layer.borderWidth = 0
        view3.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
    }
}

func testRequest(testURl: URL?, completed: @escaping ()->() ){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                searchMealOverviewDataArr = try JSONDecoder().decode(Meals.self, from: newData1)
                DispatchQueue.main.async {
                    completed()
                }
            } catch (let error) {
                print("\n---> error: \(error)")
            }
        }
    }
    task.resume()
}
