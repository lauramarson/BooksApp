//
//  HomeViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, UpdateScrollViewProtocol {
    
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var tableViewContainer: UIView!
    
    @IBOutlet var tableViewContainerHeight: NSLayoutConstraint!
    
    @IBOutlet var userPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WebServices().loadUserPicture() { [weak self] (picture) in
            let imageURL = URL(string: picture)
            let placeholderImage = UIImage(named: "imagePlaceholder")
            
            self?.userPicture.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let allBooksVC = segue.destination as? AllBooksViewController {
            allBooksVC.delegate = self
        }
    }
    
    func updateHeight(height: CGFloat) {
        tableViewContainerHeight.constant = height
    }

}
