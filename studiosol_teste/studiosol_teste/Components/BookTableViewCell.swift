//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Laura Pinheiro Marson on 30/03/22.
//

import UIKit
import SDWebImage

class BookTableViewCell: UITableViewCell {
    @IBOutlet private var coverImage: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    
    var bookCellVM: BookCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure() {
        guard let bookCellVM = bookCellVM else { return }
        
        self.titleLabel.text = bookCellVM.title
        
        self.authorLabel.text = bookCellVM.author
        
        let imageURL = bookCellVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")

        coverImage.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
    }
    
}
