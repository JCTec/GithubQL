//
//  ActivityIndicator.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import UIKit
import SwiftUI

// MARK: - ActivityIndicator
public struct ActivityIndicator: UIViewRepresentable {
    public typealias UIView = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool
    public let color: UIColor
    public let style: UIActivityIndicatorView.Style
    
    /// The ActivityIndicator is a `UIViewRepresentable` of an
    /// `UIActivityIndicatorView` fully customaizable to work
    /// in SwiftUI
    ///
    /// - Parameters:
    ///     - isAnimating: Binding representing the animation state.
    ///     - style: The Style represented in `UIActivityIndicatorView.Style`.
    ///     - color: The color of the `UIActivityIndicatorView`.
    public init(
        _ isAnimating: Binding<Bool>,
        style: UIActivityIndicatorView.Style = .large,
        color: UIColor = .white
    ) {
        self._isAnimating = isAnimating
        self.color = color
        self.style = style
    }

    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        let view = UIView()
        view.hidesWhenStopped = true
        view.style = style
        view.color = color
        
        return view
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

// MARK: - ActivityIndicator_Previews
struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(
            .constant(true),
            style: .large,
            color: .black
        )
    }
}
