//
//  DetailViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var detailVM: DetailBookViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        detailVM?.getBookDetails() { [weak self] in
            self?.descriptionLabel.text = self?.detailVM?.description
        }
    }
    
    func setup() {
        let imageURL = detailVM?.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")
        imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        
        titleLabel.text = detailVM?.title
        
        authorLabel.text = detailVM?.author
        
        if let description = detailVM?.description {
            descriptionLabel.text = description
        } else {
            descriptionLabel.text = "Carregando..."
        }
    }

}
