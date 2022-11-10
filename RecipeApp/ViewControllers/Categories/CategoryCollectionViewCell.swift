//
//  CategoryCollectionViewCell.swift
//  RecipeApp
//
//  Created by Yu_SHMBR on 02.11.2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setup(with inputData: CategoriesDataStruct){
        categoryImage.image = inputData.img
        categoryLabel.text = inputData.title
    }
}
