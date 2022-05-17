//
//  BookCollectionCell.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit

class FavoriteBookViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    
    var bookCellVM: FavoriteBookCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let bookCellVM = bookCellVM else { return }
        
        self.titleLabel.text = bookCellVM.title
        
        self.authorLabel.text = bookCellVM.author
        
        let imageURL = bookCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
    
}
