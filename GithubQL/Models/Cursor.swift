//
//  Cursor.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import Foundation

// MARK: - Cursor
struct Cursor {
    var position: Int = 0
    
    /// The `Cursor` struct is in charge of handling pagination in the
    /// `SearchQuery`.
    init() { }
    
    mutating func next() {
        position += 10
    }
    
    func encoded() -> String {
        guard let data = "cursor:\(position)"
                .data(using: .utf8) else {
            fatalError("Could not get data from cursor.")
        }
        
        return data
            .base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}
