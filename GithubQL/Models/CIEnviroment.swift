//
//  CIEnviroment.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import Foundation

// MARK: - CIEnvironment
public struct CIEnvironment {
    public static var githubToken: String = CIEnvironment.variable(named: "GITHUB_TOKEN") ?? githubToken

    /// The `CIEnviroment` can get variable values from the Runtime enviroment.
    /// This Enviroment setting can be editted by just going to
    /// `GithubQL` -> `Edit Scheme` -> `Enviroment Variables` and set
    /// the value of the variable you want to use.
    ///
    /// - Parameters:
    ///     - name: The name of the enviroment variable.
    public static func variable(named name: String) -> String? {
        let processInfo = ProcessInfo.processInfo
        guard let value = processInfo.environment[name] else {
            return nil
        }
        return value
    }
}
