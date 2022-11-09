//
//  SearchVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import UIKit

var searchMealOverviewDataArr = Meals(meals: [])
class SearchVC: UIViewController {
    
    /// views outlets
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var completeNameTF: UITextField!
    @IBOutlet weak var completeNameButton: UIButton!
    @IBOutlet weak var completeNameErrorLabel: UILabel!
    
    @IBOutlet weak var startedAtTF: UITextField!
    @IBOutlet weak var startedAtButton: UIButton!
    @IBOutlet weak var startedAtErrorLabel: UILabel!
    
    @IBOutlet weak var mainIngredientTF: UITextField!
    @IBOutlet weak var mainIngredientButton: UIButton!
    @IBOutlet weak var mainIngredientErrorLabel: UILabel!
    
    /// active TF section
    @IBAction func begin1(_ sender: Any) {
        activeTF(isActive: true, inputView: view1)
    }
    @IBAction func end1(_ sender: Any) {
        activeTF(isActive: false, inputView: view1)
    }
    
    @IBAction func begin2(_ sender: Any) {
        activeTF(isActive: true, inputView: view2)
    }
    @IBAction func end2(_ sender: Any) {
        activeTF(isActive: false, inputView: view2)
    }
    
    @IBAction func begin3(_ sender: Any) {
        activeTF(isActive: true, inputView: view3)
    }
    @IBAction func end3(_ sender: Any) {
        activeTF(isActive: false, inputView: view3)
    }
    

    
    @IBAction func completeNameChanged(_ sender: Any) {
        
        view1.layer.borderWidth = 5
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor

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
        if value.count > 20
        {
            return "Name must be < 20"
        }
        return nil
    }
    
    @IBAction func completeNameButton(_ sender: Any) {
        print(completeNameTF.text ?? "")
        
        let tfText = completeNameTF.text ?? ""
        let replaced = tfText.replacingOccurrences(of: " ", with: "%20")
        print(replaced)
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(replaced)"
        let url = URL( string: urlTemplate)
        
        testRequest(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.display = searchMealOverviewDataArr
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    

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
        let buff = startedAtTF.text
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(startedAtTF.text ?? "")"
        let url = URL( string: urlTemplate)
        
        testRequest(testURl: url){
            
            print(searchMealOverviewDataArr.meals[0].strMeal)
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
            vc?.strInput = buff!.capitalized
            vc?.output = searchMealOverviewDataArr
            
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
        let buffer = mainIngredientTF.text ?? ""
        
        let replaced = buffer.replacingOccurrences(of: " ", with: "%20")
        
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(replaced)"
        let url = URL( string: urlTemplate)
        
        thurdTFreq(testURl: url){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchIngredientVC") as? SearchIngredientVC
            vc?.output = mealsAtCategoryArr
            vc?.mainIngredient = buffer.lowercased()
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        resetForm()
    }
    
    func invalidMainIngredient(_ value: String) -> String?
    {
        if value.count > 30
        {
            return " < 30 !"
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
        
        completeNameTF.text = ""
        startedAtTF.text = ""
        mainIngredientTF.text = ""
        
        view1.layer.borderWidth = 0
        view1.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor

        view2.layer.borderWidth = 0
        view2.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
        
        view3.layer.borderWidth = 0
        view3.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
    }
}



func thurdTFreq(testURl: URL?, completed: @escaping ()->() ){
    guard let url = testURl else{
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        if let data = data, let string = String(data: data, encoding: .utf8){
            let newData1 = string.replacingOccurrences(of: "[\r|\n]" , with: "", options: [.regularExpression]).data(using: .utf8)!
            do {
                mealsAtCategoryArr = try JSONDecoder().decode(CategoryTableData.self, from: newData1)
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

func activeTF(isActive: Bool, inputView: UIView){
    if isActive{
        inputView.layer.borderWidth = 5
        inputView.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 1).cgColor
    } else{
        inputView.layer.borderWidth = 0
        inputView.layer.borderColor = UIColor(red:236/255, green:185/255, blue:0/255, alpha: 0).cgColor
    }
}
