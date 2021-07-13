//
//  SessionViewModel.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import SwiftUI

// MARK: - SessionViewModel
class SessionViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var hasError: Bool = false

    var errorTitle: String = "Something Went Wrong 🥲"
    var didValidateCredentials: (() -> Void)?
    
    init() { }
    
    /// Validate current credentials, and set and action for success and error.
    func validateCredentials() {
        Network.shared.verifyCredentials(success: { [weak self] in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.didValidateCredentials?()
            }
        }, error: { _ in
            DispatchQueue.main.async { [weak self] in
                self?.isLoading = false
                self?.hasError = true
            }
        })
    }
}
