// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoginQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Login {
      viewer {
        __typename
        login
      }
    }
    """

  public let operationName: String = "Login"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("login", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Search($afterCursor: String = "Y3Vyc29yOjA=") {
      search(
        type: REPOSITORY
        query: "graphql in:name,description,readme"
        after: $afterCursor
        first: 10
      ) {
        __typename
        repo: edges {
          __typename
          repo: node {
            __typename
            ...RepositoryParts
          }
        }
      }
    }
    """

  public let operationName: String = "Search"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + RepositoryParts.fragmentDefinition)
    document.append("\n" + OwnerInfo.fragmentDefinition)
    return document
  }

  public var afterCursor: String?

  public init(afterCursor: String? = nil) {
    self.afterCursor = afterCursor
  }

  public var variables: GraphQLMap? {
    return ["afterCursor": afterCursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["type": "REPOSITORY", "query": "graphql in:name,description,readme", "after": GraphQLVariable("afterCursor"), "first": 10], type: .nonNull(.object(Search.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SearchResultItemConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", alias: "repo", type: .list(.object(Repo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repo: [Repo?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "repo": repo.flatMap { (value: [Repo?]) -> [ResultMap?] in value.map { (value: Repo?) -> ResultMap? in value.flatMap { (value: Repo) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var repo: [Repo?]? {
        get {
          return (resultMap["repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Repo?] in value.map { (value: ResultMap?) -> Repo? in value.flatMap { (value: ResultMap) -> Repo in Repo(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Repo?]) -> [ResultMap?] in value.map { (value: Repo?) -> ResultMap? in value.flatMap { (value: Repo) -> ResultMap in value.resultMap } } }, forKey: "repo")
        }
      }

      public struct Repo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SearchResultItemEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", alias: "repo", type: .object(Repo.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(repo: Repo? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemEdge", "repo": repo.flatMap { (value: Repo) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var repo: Repo? {
          get {
            return (resultMap["repo"] as? ResultMap).flatMap { Repo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "repo")
          }
        }

        public struct Repo: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["App", "Discussion", "Issue", "MarketplaceListing", "Organization", "PullRequest", "Repository", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(RepositoryParts.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeApp() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "App"])
          }

          public static func makeDiscussion() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "Discussion"])
          }

          public static func makeIssue() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "Issue"])
          }

          public static func makeMarketplaceListing() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "MarketplaceListing"])
          }

          public static func makeOrganization() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "Organization"])
          }

          public static func makePullRequest() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> Repo {
            return Repo(unsafeResultMap: ["__typename": "User"])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var repositoryParts: RepositoryParts? {
              get {
                if !RepositoryParts.possibleTypes.contains(resultMap["__typename"]! as! String) { return nil }
                return RepositoryParts(unsafeResultMap: resultMap)
              }
              set {
                guard let newValue = newValue else { return }
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public struct OwnerInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment OwnerInfo on RepositoryOwner {
      __typename
      login
      avatarUrl
    }
    """

  public static let possibleTypes: [String] = ["Organization", "User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("login", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public static func makeOrganization(login: String, avatarUrl: String) -> OwnerInfo {
    return OwnerInfo(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
  }

  public static func makeUser(login: String, avatarUrl: String) -> OwnerInfo {
    return OwnerInfo(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The username used to login.
  public var login: String {
    get {
      return resultMap["login"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "login")
    }
  }

  /// A URL pointing to the owner's public avatar.
  public var avatarUrl: String {
    get {
      return resultMap["avatarUrl"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatarUrl")
    }
  }
}

public struct RepositoryParts: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment RepositoryParts on Repository {
      __typename
      name
      url
      stargazerCount
      owner {
        __typename
        ...OwnerInfo
      }
    }
    """

  public static let possibleTypes: [String] = ["Repository"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
      GraphQLField("stargazerCount", type: .nonNull(.scalar(Int.self))),
      GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, url: String, stargazerCount: Int, owner: Owner) {
    self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "url": url, "stargazerCount": stargazerCount, "owner": owner.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The HTTP URL for this repository
  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  /// Returns a count of how many stargazers there are on this object
  public var stargazerCount: Int {
    get {
      return resultMap["stargazerCount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "stargazerCount")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Organization", "User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(OwnerInfo.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(login: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
    }

    public static func makeUser(login: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var ownerInfo: OwnerInfo {
        get {
          return OwnerInfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
