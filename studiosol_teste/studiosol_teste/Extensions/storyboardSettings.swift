//
//  storyboardSettings.swift
//  Movies
//
//  Created by Laura Pinheiro Marson on 30/03/22.
//

import UIKit

@IBDesignable extension UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
}

@IBDesignable extension UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
}
