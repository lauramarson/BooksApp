// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BookDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query BookDetails($bookID: ID!) {
      book(id: $bookID) {
        __typename
        id
        name
        cover
        author {
          __typename
          name
        }
        description
      }
    }
    """

  public let operationName: String = "BookDetails"

  public var bookID: GraphQLID

  public init(bookID: GraphQLID) {
    self.bookID = bookID
  }

  public var variables: GraphQLMap? {
    return ["bookID": bookID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("book", arguments: ["id": GraphQLVariable("bookID")], type: .nonNull(.object(Book.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(book: Book) {
      self.init(unsafeResultMap: ["__typename": "Query", "book": book.resultMap])
    }

    public var book: Book {
      get {
        return Book(unsafeResultMap: resultMap["book"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "book")
      }
    }

    public struct Book: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Book"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, cover: String, author: Author, description: String) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "name": name, "cover": cover, "author": author.resultMap, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
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

public final class FavoriteBooksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FavoriteBooks {
      favoriteBooks {
        __typename
        id
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
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("cover", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, cover: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Book", "id": id, "name": name, "cover": cover, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
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
