//
//  SessionView.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI

// MARK: - SessionView
struct SessionView: View {
    @ObservedObject var viewModel = SessionViewModel()
    let didValidateCredentials: () -> Void
    
    /// The `SessionView` View lets validate the current Github
    /// credentials, and making the GithubAPI is reachable.
    /// It comes with a convenience callback that can be easily implemented.
    ///
    /// - Parameters:
    ///     - didValidateCredentials: The action to exectute when the credentials are validated.
    init(
        _ didValidateCredentials: @escaping () -> Void = { print("SessionView") }
    ) {
        self.didValidateCredentials = didValidateCredentials
    }

    var body: some View {
        ZStack {
            Color.background
                .ignoringSafeArea()
            
            VStack(alignment: .center, spacing: 5.0) {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300.0, height: 300.0, alignment: .center)
                
                if !viewModel.isLoading && viewModel.hasError {
                    Group {
                        Text(viewModel.errorTitle)
                            .font(.body)
                        
                        RetryButton {
                            viewModel.isLoading = true
                            viewModel.hasError = false

                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                // We validate the credentials after an smooth transition.
                                viewModel.validateCredentials()
                            }
                        }
                    }.offset(x: 0.0, y: -40.0)
                } else {
                    ActivityIndicator(
                        $viewModel.isLoading,
                        style: .medium,
                        color: .label
                    ).offset(x: 0.0, y: -40.0)
                }
            }
        }.onAppear(perform: {
            // We pass the action down to the View Model and we validate the credentials.
            viewModel.didValidateCredentials = didValidateCredentials
            viewModel.validateCredentials()
        })
    }
}
