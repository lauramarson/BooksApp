//
//  AuthorCell.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

class AuthorCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var booksCountLabel: UILabel!
    
    var authorCellVM: AuthorCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let authorCellVM = authorCellVM else { return }
        
        self.nameLabel.text = authorCellVM.name
        
        let booksCount = authorCellVM.booksCount
        if booksCount == 1 {
            self.booksCountLabel.text = "\(booksCount) livro"
        } else {
            self.booksCountLabel.text = "\(booksCount) livros"
        }
        
        let imageURL = authorCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
}
