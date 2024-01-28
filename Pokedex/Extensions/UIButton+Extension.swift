//
//  UIButton+Extension.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import UIKit

extension UIButton {
    
    func setButton() {
        self.backgroundColor = .green.withAlphaComponent(0.4)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 15
        self.layer.shadowOffset = .init(width: 0.0, height: 18.0)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 8.0
        self.layer.shadowOpacity = 9.0
        self.layer.masksToBounds = false
    }
}
