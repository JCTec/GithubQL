//
//  Network.swift
//  GithubQL
//
//  Created by Juan Carlos on 12/07/21.
//

import Apollo

// MARK: - NetworkError
enum NetworkError: Error {
    case unrecognizedError
}

// MARK: - Network
class Network {
    static let shared = Network()
    
    let client: ApolloClient
    
    /// The Network Layer is in charge of validating the credentials of the user,
    /// that in this case come from the `Github Token`, as well as handling the client
    /// connections.
    init() {
        guard let url = URL(string: "https://api.github.com/graphql") else {
            fatalError("Couldn't parse Github GraphQL URL.")
        }
        
        // RequestChainNetworkTransport allow us to create a client with the Authorization Header.
        // https://www.apollographql.com/docs/ios/api/Apollo/classes/RequestChainNetworkTransport/
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let transport = RequestChainNetworkTransport(
            interceptorProvider: DefaultInterceptorProvider(store: store),
            endpointURL: url,
            additionalHeaders: [
                "Authorization": CIEnvironment.githubToken.bearerToken
            ]
        )
        
        client = ApolloClient(networkTransport: transport, store: store)
    }
    
    /// Validate current credentials, and set and action for success and error.
    func verifyCredentials(success: @escaping () -> Void, error: @escaping (Error) -> Void) {
        Network.shared.client.fetch(query: LoginQuery(), queue: DispatchQueue.global(qos: .background)) { result in
            switch result {
                case .success(let graphQLResult):
                    guard graphQLResult.data != nil else {
                        error(NetworkError.unrecognizedError)
                        return 
                    }
                    
                    DispatchQueue.main.async {
                        success()
                    }
                case .failure(let errorVal):
                    guard (errorVal as? Apollo.ResponseCodeInterceptor.ResponseCodeError) == nil else {
                        fatalError("""
                        Please set the Github Token either via the Enviroment Variables or statically
                        in the GraphQLClientProtocol.swift file.
                        
                        Current current token is: \(CIEnvironment.githubToken)
                        """)
                    }
                    
                    DispatchQueue.main.async {
                        error(errorVal)
                    }
            }
        }
    }
}
