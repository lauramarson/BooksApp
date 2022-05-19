//
//  Network.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 14/05/22.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://us-central1-ss-devops.cloudfunctions.net/GraphQL")!)
}
