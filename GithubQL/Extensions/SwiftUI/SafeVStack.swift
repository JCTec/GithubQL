//
//  SafeVStack.swift
//  GithubQL
//
//  Created by Juan Carlos on 13/07/21.
//

import SwiftUI

@available(iOS 13.0, *)
public struct SafeVStack<Content: View>: View {
    let content: Content
    let alignment: HorizontalAlignment
    let spacing: CGFloat?
    
    /// Creates a lazy vertical stack view with the given spacing if the iOS is above 14 if not it falls back to `VStack`,
    /// vertical alignment, and content.
    ///
    /// - Note: iOS 13 Minimum.
    ///
    /// - Parameters:
    ///     - alignment: The guide for aligning the subviews in this stack. All
    ///     child views have the same horizontal screen coordinate.
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        if #available(iOS 14.0, *) {
            LazyVStack(alignment: alignment, spacing: spacing) {
                content
            }
        } else {
            VStack(alignment: alignment, spacing: spacing) {
                content
            }
        }
    }
}

struct SafeVStack_Previews: PreviewProvider {
    static var previews: some View {
        SafeVStack(alignment: .center) {
            Text("Hello")
            Text("World")
            Text("I'm")
            Text("Vertically")
            Text("Aligned")
        }
    }
}
