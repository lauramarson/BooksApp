//
//  FirstMoviesViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 13/05/22.
//

import UIKit

private let reuseIdentifier = "Book"

class FirstBooksViewController: UIViewController {
    
    private func loadLaunches() {
      Network.shared.apollo
        .fetch(query: FavoriteBooksQuery()) { [weak self] result in
        
        guard let self = self else {
          return
        }

        defer {
            self.collectionView.reloadData()
        }
                
        switch result {
        case .success(let graphQLResult):
            if let launchConnection = graphQLResult.data?.favoriteBooks {
                self.favoriteBooks.append(contentsOf: launchConnection.compactMap { $0 })
            }
                    
            if let errors = graphQLResult.errors {
              let message = errors
                    .map { $0.localizedDescription }
                    .joined(separator: "\n")
//              self.showAlert(title: "GraphQL Error(s)",
//                             message: message)
                print("\(message)")
            }
        case .failure(let error):
          // From `UIViewController+Alert.swift`
//          self.showAlert(title: "Network Error",
//                         message: error.localizedDescription)
            print("\(error.localizedDescription)")
        }
      }
    }
    
    var favoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
    
    enum ListSection: Int, CaseIterable {
      case favoriteBooks
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.loadLaunches()
    }

}

extension FirstBooksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          guard let listSection = ListSection(rawValue: section) else {
            assertionFailure("Invalid section")
            return 0
          }
                
          switch listSection {
          case .favoriteBooks:
            return self.favoriteBooks.count
          }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BookCollectionViewCell else {
            return UICollectionViewCell()
        }

        guard let listSection = ListSection(rawValue: indexPath.section) else {
            assertionFailure("Invalid section")
            return cell
        }
            
        switch listSection {
        case .favoriteBooks:
            let launch = self.favoriteBooks[indexPath.row]
            cell.imageView.image = UIImage(named: "imagePlaceholder")
            cell.authorLabel.text = launch.author.name
            cell.titleLabel.text = launch.name
          }
        
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

extension FirstBooksViewController: UICollectionViewDelegate {
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
//
//        let movie = favoritesVM.modelAt(indexPath.row)
//        dvc.detailVM = DetailMovieViewModel(movie: movie)
//        dvc.delegate = self
//        dvc.fromFavoriteVC = true
//
//        self.present(dvc, animated: true)
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

