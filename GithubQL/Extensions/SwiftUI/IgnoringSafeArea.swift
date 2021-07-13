//
//  IgnoringSafeArea.swift
//  GithubQL
//
//  Created by Juan Carlos on 13/07/21.
//

import SwiftUI

struct IgnoringSafeArea: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .ignoresSafeArea()
        } else {
            content
                .edgesIgnoringSafeArea(.all)
        }
    }
}

extension View {
    func ignoringSafeArea() -> some View {
        self.modifier(IgnoringSafeArea())
    }
}
