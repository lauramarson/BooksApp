//
//  CategoryCell.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet var categoryButton: UIButton!
    
    override func awakeFromNib() {
         super.awakeFromNib()
     }
    
    func setupButton(category: String) {
        categoryButton.setTitle(" \(category) ", for: .normal)
        
        if category == "Todos" {
            categoryButton.backgroundColor = UIColor(hex: "#A076F2ff")
            categoryButton.setTitleColor(.white, for: .normal)
        } else {
            categoryButton.backgroundColor = .white
            categoryButton.setTitleColor(UIColor(hex: "#757575ff"), for: .normal)
        }
    }
    
}
