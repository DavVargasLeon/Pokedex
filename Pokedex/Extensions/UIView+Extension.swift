//
//  UIView+Extension.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import UIKit

extension UIView {
    
    func registerSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }
    
    func setcontainerView(with color: UIColor) {
        self.layer.cornerRadius = 5
        self.backgroundColor = color.withAlphaComponent(0.4)
        self.layer.borderWidth = 2
        self.layer.borderColor = color.cgColor
    }
    
}
