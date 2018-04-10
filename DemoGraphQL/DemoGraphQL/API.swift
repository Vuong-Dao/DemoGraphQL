//  This file was automatically generated and should not be edited.

import Apollo

public final class AllBooksQuery: GraphQLQuery {
  public static let operationString =
    "query allBooks {\n  allBooks {\n    __typename\n    author\n    title\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allBooks", type: .nonNull(.list(.nonNull(.object(AllBook.selections))))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(allBooks: [AllBook]) {
      self.init(snapshot: ["__typename": "Query", "allBooks": allBooks.map { (value: AllBook) -> Snapshot in value.snapshot }])
    }

    public var allBooks: [AllBook] {
      get {
        return (snapshot["allBooks"] as! [Snapshot]).map { (value: Snapshot) -> AllBook in AllBook(snapshot: value) }
      }
      set {
        snapshot.updateValue(newValue.map { (value: AllBook) -> Snapshot in value.snapshot }, forKey: "allBooks")
      }
    }

    public struct AllBook: GraphQLSelectionSet {
      public static let possibleTypes = ["Book"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("author", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(author: String, title: String) {
        self.init(snapshot: ["__typename": "Book", "author": author, "title": title])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var author: String {
        get {
          return snapshot["author"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "author")
        }
      }

      public var title: String {
        get {
          return snapshot["title"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}