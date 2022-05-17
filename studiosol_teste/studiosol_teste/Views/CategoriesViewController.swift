//
//  CategoriesViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var collectionLayout: UICollectionViewFlowLayout!
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

        
        cell.categoryLabel.text = categories[indexPath.row]

        return cell
    }

}

extension CategoriesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
