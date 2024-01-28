//
//  File.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import Foundation
import UIKit

extension UILabel {
    func setLabel(ofSize fontSize: CGFloat, isTitle: Bool = false) {
        self.font = .systemFont(ofSize: fontSize, weight: isTitle ? .heavy : .semibold)
        self.textAlignment = .center
        self.textColor = .black
        self.numberOfLines = isTitle ? 1 : 0
        self.adjustsFontSizeToFitWidth = isTitle
    }
}
