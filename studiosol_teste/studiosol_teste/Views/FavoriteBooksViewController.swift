//
//  FirstMoviesViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit
import SDWebImage

class FavoriteBooksViewController: UIViewController {
    private let reuseIdentifier = "FavoriteBook"
    
    var booksCollectionVM = FavoriteBooksViewModel()
    
    @IBOutlet var collectionView: UICollectionView!
    
    weak var delegate: ShowAlertProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        booksCollectionVM.getFavoriteBooks { [weak self] (error) in
            if let error = error {
                guard let alert = self?.fetchAlert(title: "Erro ao carregar livros favoritos", message: error) else {return}
                self?.delegate?.alert(alert)
            } else {
                self?.collectionView.reloadData()
            }
            
        }
    }
}

extension FavoriteBooksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksCollectionVM.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FavoriteBookViewCell else {
            return UICollectionViewCell()
        }
        
        let book = booksCollectionVM.modelAt(indexPath.row)
        cell.bookCellVM = BookCellViewModel(book)
        
        cell.configure()

        return cell
    }

}

extension FavoriteBooksViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }

        let book = booksCollectionVM.modelAt(indexPath.row)
        dvc.detailVM = DetailBookViewModel(book: book)

        navigationController?.pushViewController(dvc, animated: true)
    }
}
