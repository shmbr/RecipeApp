////
////  ButtonsExtentions.swift
////  RecipeApp
////
////  Created by Yu_SHMBR on 03.11.2022.
////

import Foundation
import UIKit

// add corner radius params setting
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
