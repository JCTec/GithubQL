//
//  GithubRepository.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - GithubRepository
struct GithubRepository: View {
    let repository: RepositoryParts
    let geometry: GeometryProxy
    
    /// The `GithubRepository` View lets you generate a Card
    /// holding all the information needed for `RepositoryParts`
    ///
    /// - Parameters:
    ///     - repository: The `RepositoryParts` object.
    ///     - geometry: The devices geometry proxy.
    init(
        _ repository: RepositoryParts,
        with geometry: GeometryProxy
    ) {
        self.repository = repository
        self.geometry = geometry
    }

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                if let url = URL(string: repository.owner.fragments.ownerInfo.avatarUrl) {
                    WebImage(url: url)
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: 50.0, height: 50.0, alignment: .leading)
                        .mask(
                            RoundedRectangle(cornerRadius: 25.0)
                        )
                } else {
                    Image("GitHub Mark")
                        .frame(width: 50.0, height: 50.0, alignment: .leading)
                        .mask(
                            RoundedRectangle(cornerRadius: 25.0)
                        )
                }
                
                Spacer()
            }.padding(.leading, 20.0)
            
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text(repository.owner.fragments.ownerInfo.login)
                        .foregroundColor(.black)
                    
                    Text("/")
                        .foregroundColor(.black)
                    
                    Text(repository.name)
                        .foregroundColor(.black)
                }
                
                HStack {
                    
                    Text(repository.stargazerCount.stars())
                        .foregroundColor(.black)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            
        }
        .padding(.top, 20.0)
        .frame(width: geometry.size.width - 20.0, height: 90.0, alignment: .leading)
        .background(
            Color.white
                .mask(
                    RoundedRectangle(cornerRadius: 10.0)
                )
        )
        .padding(.leading, 10.0)
    }
}
