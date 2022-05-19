//
//  DetailViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var detailView: UIView!
    
    var detailVM: DetailBookViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDetailView()

        detailVM?.getBookDetails() { [weak self] in
            self?.setup()
        }
    }
    
    private func setup() {
        guard let detailVM = detailVM else { return }
        
        let imageURL = detailVM.imageURL
        let placeholderImage = UIImage(named: "imagePlaceholder")
        imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        
        titleLabel.text = detailVM.title
        
        authorLabel.text = detailVM.author
        
        descriptionLabel.text = detailVM.description
        
        if !detailVM.isFavorite {
            favoriteButton.imageView?.image = UIImage(named: "notfav")
        }
    }
    
    private func setupDetailView() {
        detailView.layer.shadowOffset = CGSize(width: 0,
                                          height: -1)
        detailView.layer.shadowRadius = 1
        detailView.layer.shadowOpacity = 0.05
        
        detailView.layer.cornerRadius = 40
        detailView.layer.maskedCorners = [.layerMinXMinYCorner]
    }

    @IBAction private func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
