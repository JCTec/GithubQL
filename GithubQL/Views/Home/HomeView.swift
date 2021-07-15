//
//  HomeView.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI

// MARK: - HomeView
struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    /// The Home View has a simple list view plus some titles all
    /// wrapped around a vertical ScrollView, note the use of
    /// SafeVStack instead of LazyVStack, this is my own implementation
    /// of a LazyVStack Compatible with iOS 13 (Not really in terms of
    /// performance but keeps the code clean.).
    init() { }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.background
                    .ignoringSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    SafeVStack(alignment: .leading) {
                        Text("GithubQL")
                            .padding(.leading, 10.0)
                            .font(.title)
                        
                        Text("A small iPhone application that queries Github to get repositories that mention GraphQL")
                            .padding(.horizontal, 10.0)
                            .font(.subheadline)
                        
                        if let repositories = viewModel.repositories {
                            ForEach(repositories.indices, id: \.self) { repositoryIndex in
                                GithubRepository(
                                    repositories[repositoryIndex],
                                    with: geometry
                                )
                                .onAppear(perform: {
                                    if repositoryIndex == repositories.count - 1 {
                                        viewModel.loadMoreContent()
                                    }
                                })
                                .padding(.top, 20.0)
                            }
                        }
                        
                        CenterView {
                            ActivityIndicator(
                                $viewModel.isLoading,
                                style: .medium,
                                color: .label
                            )
                        }.padding(.top, 20.0)
                    }
                }
                .padding(.top, 60.0)
            }
            .onAppear(perform: viewModel.loadRepositories)
            .ignoringSafeArea()
        }
    }
}

// MARK: - HomeView_Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
