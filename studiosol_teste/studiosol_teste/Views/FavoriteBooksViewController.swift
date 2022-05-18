//
//  FirstMoviesViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "FavoriteBook"

class FavoriteBooksViewController: UIViewController {
    
    var booksCollectionVM = FavoriteBooksViewModel()
//
//    enum ListSection: Int, CaseIterable {
//      case favoriteBooks
//    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        booksCollectionVM.getFavoriteBooks { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
//    private func loadLaunches() {
//      Network.shared.apollo
//        .fetch(query: FavoriteBooksQuery()) { [weak self] result in
//        
//        guard let self = self else {
//          return
//        }
//
//        defer {
//            self.collectionView.reloadData()
//        }
//                
//        switch result {
//        case .success(let graphQLResult):
//            if let launchConnection = graphQLResult.data?.favoriteBooks {
//                self.favoriteBooks.append(contentsOf: launchConnection.compactMap { $0 })
//            }
//                    
//            if let errors = graphQLResult.errors {
//              let message = errors
//                    .map { $0.localizedDescription }
//                    .joined(separator: "\n")
////              self.showAlert(title: "GraphQL Error(s)",
////                             message: message)
//                print("\(message)")
//            }
//        case .failure(let error):
//          // From `UIViewController+Alert.swift`
////          self.showAlert(title: "Network Error",
////                         message: error.localizedDescription)
//            print("\(error.localizedDescription)")
//        }
//      }
//    }

}

extension FavoriteBooksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksCollectionVM.numberOfItems()
//          guard let listSection = ListSection(rawValue: section) else {
//            assertionFailure("Invalid section")
//            return 0
//          }
//
//          switch listSection {
//          case .favoriteBooks:
//            return self.favoriteBooks.count
//          }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? FavoriteBookViewCell else {
            return UICollectionViewCell()
        }
        
        let book = booksCollectionVM.modelAt(indexPath.row)
        cell.bookCellVM = FavoriteBookCellViewModel(book)
        
        cell.configure()

//        guard let listSection = ListSection(rawValue: indexPath.section) else {
//            assertionFailure("Invalid section")
//            return cell
//        }
            
//        switch listSection {
//        case .favoriteBooks:
//            let book = self.favoriteBooks[indexPath.row]
//
//            let imageURL = URL(string: book.cover)
//            let placeholderImage = UIImage(named: "imagePlaceholder")
//
//            cell.imageView.sd_setImage(with: imageURL, placeholderImage: placeholderImage)
//
//            cell.imageView.image = UIImage(named: "imagePlaceholder")
//            cell.authorLabel.text = book.author.name
//            cell.titleLabel.text = book.name
//          }
        
//
//        let imageData = favoritesVM.posterAt(indexPath.row)
//
//        let posterImage = UIImage(data: imageData)
//        cell.imageView.image = posterImage
//
//        cell.layer.cornerRadius = 5
//        cell.imageView.image = UIImage(named: "imagePlaceholder")
//        cell.authorLabel.text = "Autor"
//        cell.titleLabel.text = "Título do Livro"

        return cell
    }

}

extension FavoriteBooksViewController: UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }

        let bookID = booksCollectionVM.modelAt(indexPath.row).id
        dvc.detailVM = DetailBookViewModel(bookID: bookID)

        navigationController?.pushViewController(dvc, animated: true)
    }
}

//
//extension FirstBooksViewController:  UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: 196, height: 360)
//
//    }
//
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: 300, height: 306)
////        }
//    }

