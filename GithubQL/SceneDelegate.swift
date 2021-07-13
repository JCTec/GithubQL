//
//  SceneDelegate.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // We first set the SessionView that will validate that the github token is valid and that the Github API is reachable.
        // Once finished we set the HomeView as root view.
        
        if let windowScene = scene as? UIWindowScene {
            let contentView = SessionView {
                // We add 0.25 seconds after to create a smoother transition.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
                    // We set HomeView as root.
                    self?.setRootView(for: HomeView(), in: windowScene)
                }
            }
            
            // We set Session View as root.
            setRootView(for: contentView, in: windowScene)
        }
    }
    
    /// The `setRootView<Content>` function sets a SwiftUI `View` to be the current root
    /// view controller.
    ///
    /// - Parameters:
    ///     - swiftUIView: The SwiftUI `View` to set as root.
    ///     - windowScene: The `UIWindowScene` to set the `View`
    func setRootView<Content>(for swiftUIView: Content, in windowScene: UIWindowScene) where Content: View {
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = UIColor(named: "Background")
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = hostingController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}
