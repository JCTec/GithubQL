//
//  RetryButton.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI

// MARK: - RetryButton
struct RetryButton: View {
    let action: () -> Void
    
    /// The `RetryButton` lets you easily retry a function or action.
    ///
    /// - Parameters:
    ///     - action: The action to retry.
    init(
        _ action: @escaping () -> Void = { print("RetryButton") }
    ) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing: 10.0) {
                Text("Retry")
                    .foregroundColor(.black)

                Image(systemName: "arrow.counterclockwise")
                    .foregroundColor(.black)
            }
        })
        .frame(
            width: 200.0,
            height: 40.0,
            alignment: .center
        )
        .background(
            Color.white
                .mask(
                    RoundedRectangle(cornerRadius: 10.0)
                )
                .shadow(
                    color: Color.black.opacity(0.25),
                    radius: 2.5,
                    x: 0.0,
                    y: 2.0
                )
        )
    }
}

// MARK: - RetryButton_Previews
struct RetryButton_Previews: PreviewProvider {
    static var previews: some View {
        RetryButton()
    }
}
