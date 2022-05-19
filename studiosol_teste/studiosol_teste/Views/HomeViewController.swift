//
//  HomeViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, UpdateScrollViewProtocol, ShowAlertProtocol {
    
    @IBOutlet var tableViewContainerHeight: NSLayoutConstraint!
    
    @IBOutlet var userPicture: UIImageView!
    
    @IBOutlet var headerView: UIView!
    
    @IBOutlet var authorsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        WebServices().loadUserPicture() { [weak self] (picture) in
            let imageURL = URL(string: picture)
            let placeholderImage = UIImage(named: "imagePlaceholder")
            
            self?.userPicture.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        }

    }
    
    func setupView() {
        headerView.layer.shadowOffset = CGSize(width: 0,
                                          height: 1)
        headerView.layer.shadowRadius = 1
        headerView.layer.shadowOpacity = 0.05
        
        headerView.layer.cornerRadius = 40
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        authorsView.layer.cornerRadius = 40
        authorsView.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let allBooksVC = segue.destination as? AllBooksViewController {
            allBooksVC.heightDelegate = self
            allBooksVC.alertDelegate = self
        }
        
        if let favoriteBooksVC = segue.destination as? FavoriteBooksViewController {
            favoriteBooksVC.delegate = self
        }
        
        if let favoriteAuthorsVC = segue.destination as? FavoriteAuthorsViewController {
            favoriteAuthorsVC.delegate = self
        }
    }
    
    func updateHeight(height: CGFloat) {
        tableViewContainerHeight.constant = height
    }
    
    func alert(_ alert: UIAlertController) {
        present(alert, animated: true)
    }

}

