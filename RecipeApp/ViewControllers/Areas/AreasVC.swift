//
//  AreasVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 03.11.2022.
//

import UIKit

class AreasVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text =  areas[indexPath.row].strFlag + " " + areas[indexPath.row].strName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AreaOverwievVC") as? AreaOverwievVC
        vc?.areaName = areas[indexPath.row].strName
        vc?.areaFlag = areas[indexPath.row].strFlag
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
