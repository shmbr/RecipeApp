//
//  CategoryVC.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import UIKit

class CategoryVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension CategoryVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.setup(with: categories[indexPath.row])
        return cell
    }
}

extension CategoryVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 125)
    }
}

extension CategoryVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryOverwieVC") as? CategoryOverwieVC
        vc?.categoryName = categories[indexPath.row].title
        vc?.categoryImg = categories[indexPath.row].img
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
