//
//  FavoriteAuthorsViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

class FavoriteAuthorsViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!

    private let reuseIdentifier = "Author"
    
    var favoriteAuthorsVM = FavoriteAuthorsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        favoriteAuthorsVM.getFavoriteAuthors { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension FavoriteAuthorsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteAuthorsVM.numberOfItems(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? AuthorCell else {
            return UICollectionViewCell()
        }

        let author = favoriteAuthorsVM.modelAt(indexPath.row)
        cell.authorCellVM = AuthorCellViewModel(author)

        cell.configure()

        return cell
    }

}

extension FavoriteAuthorsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
