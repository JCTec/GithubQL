//
//  String+Bearer.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import Foundation

extension String {
    
    /// Returns the value of the string interpolated with `Bearer Token`
    var bearerToken: String {
        "Bearer \(self)"
    }
    
}
