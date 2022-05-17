//
//  CategoriesViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
//    @IBOutlet var collectionLayout: UICollectionViewFlowLayout! {
//        didSet {
//            collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
//    }
    
    
    
    private let reuseIdentifier = "Category"
    
    private let categories = ["Todos", "Romance", "Aventura", "Comédia", "Terror", "Tecnologia", "Viagem"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension CategoriesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }

        cell.categoryButton.setTitle(" \(categories[indexPath.row]) ", for: .normal)
        cell.layer.borderWidth = CGFloat(0.5)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 20.0

        return cell
    }

}

extension CategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = categories[indexPath.row]
        let itemWidth = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)
        ]).width
        return CGSize(width: itemWidth + 50, height: 43)
    }
}
