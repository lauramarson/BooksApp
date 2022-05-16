//
//  WebServices.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 16/05/22.
//

import Foundation
import Apollo

class WebServices {
    
    func loadFavoriteBooks(completion: @escaping ([FavoriteBooksQuery.Data.FavoriteBook]) -> ()) {
      Network.shared.apollo
        .fetch(query: FavoriteBooksQuery()) { result in
        
//        guard let self = self else {
//          return
//        }

//        defer {
//            self.collectionView.reloadData()
//        }
                
        switch result {
        case .success(let graphQLResult):
            var favoriteBooks = [FavoriteBooksQuery.Data.FavoriteBook]()
            if let launchConnection = graphQLResult.data?.favoriteBooks {
                favoriteBooks.append(contentsOf: launchConnection.compactMap { $0 })
                completion(favoriteBooks)
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
    
}
