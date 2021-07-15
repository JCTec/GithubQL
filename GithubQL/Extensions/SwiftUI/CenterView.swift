//
//  CenterView.swift
//  GithubQL
//
//  Created by Juan Carlos on 15/07/21.
//

import SwiftUI

public struct CenterView<Content: View>: View {
    let content: Content
    let spacing: CGFloat?
    
    /// `CenterView`will create center any view inside the content
    /// horizontally.
    ///
    /// - Parameters:
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - content: A view builder that creates the content of this stack.
    public init(spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        HStack(alignment: .center, spacing: spacing) {
            Spacer()
            
            content
            
            Spacer()
        }
    }
}

public struct CenterViewVertically<Content: View>: View {
    let content: Content
    let spacing: CGFloat?
    
    /// `CenterView`will create center any view inside the content
    /// vertically.
    ///
    /// - Parameters:
    ///     - spacing: The distance between adjacent subviews, or `nil` if you
    ///       want the stack to choose a default distance for each pair of
    ///       subviews.
    ///     - content: A view builder that creates the content of this stack.
    public init(spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            Spacer()
            
            content
            
            Spacer()
        }
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            Text("Leading Align")
            
            CenterView {
                Text("Center Align")
            }
        }
    }
}
