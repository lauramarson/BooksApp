//
//  HomeViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit

class HomeViewController: UIViewController, UpdateScrollViewProtocol {
    
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var tableViewContainer: UIView!
    
    @IBOutlet var tableViewContainerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
