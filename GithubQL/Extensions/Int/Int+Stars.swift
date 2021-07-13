//
//  Int+Stars.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import Foundation

extension Int {
    
    /// If the value exceeds 999 it is divided appended a K.
    func stars() -> String {
        if self > 999 {
            return "\(Double(self) / 1000.0)K"
        } else {
            return "\(self)"
        }
    }
}
