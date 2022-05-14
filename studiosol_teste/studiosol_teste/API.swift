// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FavoriteBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteBooks {
      favoriteBooks {
        __typename
        name
        cover
        author {
          __typename
          name
        }
      }
    }
    """

  public let operationName: String = "FavoriteBooks"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("favoriteBooks", type: .nonNull(.list(.nonNull(.object(FavoriteBook.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(favoriteBooks: [FavoriteBook]) {
      self.init(unsafeResultMap: ["__typename": "Query", "favoriteBooks": favoriteBooks.map { (value: FavoriteBook) -> ResultMap in value.resultMap }])
    }

    public var favoriteBooks: [FavoriteBook] {
      get {
        return (resultMap["favoriteBooks"] as! [ResultMap]).map { (value: ResultMap) -> FavoriteBook in FavoriteBook(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FavoriteBook) -> ResultMap in value.resultMap }, forKey: "favoriteBooks")
      }
    }

    public struct FavoriteBook: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, cover: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Book", "name": name, "cover": cover, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var cover: String {
        get {
          return resultMap["cover"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "cover")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Author"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Author", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}
