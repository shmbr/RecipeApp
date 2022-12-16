//
//  SearchVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 04.11.2022.
//

import UIKit

var err = ""

class SearchVC: UIViewController {
    
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
    
    // MARK: - TextFields Changed
    
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
    
    // MARK: - Buttons
    
    @IBAction func completeNameButton(_ sender: Any) {
        let tfText = completeNameTF.text ?? ""
        let replaced = tfText.replacingOccurrences(of: " ", with: "%20")
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(replaced)"
        let url = URL( string: urlTemplate)
        getMealRequest(testURl: url){
            if err == "error"{
                self.noDataAlert(title: "Sorry!", msg: "But there isn't such a meal in our database")
                err = ""
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MealOverviewVC") as? MealOverviewVC
            vc?.mealToDisplay = meal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    @IBAction func startedAtButton(_ sender: Any) {
        let tfText = startedAtTF.text
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/search.php?f=\(startedAtTF.text ?? "")"
        let url = URL( string: urlTemplate)
        getMealRequest(testURl: url){
            if err == "error"{
                self.noDataAlert(title: "Sorry!", msg: "But there aren't meals that started at ' ' in our database")
                err = ""
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as? SearchResultVC
            vc?.userRequestParameter = tfText!.capitalized
            vc?.output = meal
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    @IBAction func mainIngredientButton(_ sender: Any) {
        let tfText = mainIngredientTF.text ?? ""
        let replaced = tfText.replacingOccurrences(of: " ", with: "%20")
        let urlTemplate = "https://www.themealdb.com/api/json/v1/1/filter.php?i=\(replaced)"
        let url = URL( string: urlTemplate)
        getFilteredDataRequest(testURl: url){
            if err == "error"{
                self.noDataAlert(title: "Sorry!", msg: "But there isn't such an ingredient in our database")
                err = ""
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchIngredientVC") as? SearchIngredientVC
            vc?.output = filteredDataArr
            vc?.mainIngredient = tfText.lowercased()
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        resetForm()
    }
    
    // MARK: - Validations
    func invalidCompleteName(_ value: String) -> String?
    {
        if value.count < 3
        {
            return "Min 3 symbols!"
        }
        return nil
    }
    
    func invalidStartedAt(_ value: String) -> String?
    {
        if value.count != 1
        {
            return "Input only one symbol!"
        }
        return nil
    }
    
    func invalidMainIngredient(_ value: String) -> String?
    {
        if value.count < 3
        {
            return "Min 3 symbols!"
        }
        return nil
    }

    
    // MARK: - Reset
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
    
    func noDataAlert(title: String, msg: String){
        // Create new Alert
        let dialogMessage = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    }
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
