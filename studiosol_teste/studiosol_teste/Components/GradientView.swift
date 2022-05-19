//
//  GradientView.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 19/05/22.
//

import Foundation
import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = self.layer as? CAGradientLayer

        gradientLayer?.colors = [UIColor.black.withAlphaComponent(0.75).cgColor,
                                    UIColor.black.withAlphaComponent(0.0).cgColor]
        backgroundColor = UIColor.clear
    }
}
