# GithubQL
A small iPhone application that queries Github to get repositories that mention GraphQL, Created for the The Peek iOS Coding Challenge

<img src="https://cdn.worldvectorlogo.com/logos/graphql.svg" width="200" height="200" /><img src="https://d2z5w7rcu7bmie.cloudfront.net/assets/images/logo.png" width="200" height="200" />

## Session View
The first entrance of the App is in the SceneDelegate that generates a Session View, this Session View it is in charge of validating that the Github Token is valid and that the GithubAPI is Reachable.
The Session View has a callback that triggers a change in the Scene delegate to the Home View once the validation process happens.

## Home View
The Home View is a simple list view that loads the Github Repositories into the view, it has a Infinite Scroll Build into the View. note the use of SafeVStack instead of LazyVStack, this is my own implementation of a LazyVStack Compatible with iOS 13 (Not really in terms of performance but keeps the code clean).

## TODO's 
Due to time restrictions there are several things that can be later improve in this project, in between them are:
 - Unit Testing
 - UI Testing
 - Github Actions
 - Async loading of data in home view.
 - A more complex set of errors.
 - No internet connection warnings in the Home View
 - Detail view for the GithubRepository.

## SDWeb Image SwiftUI
The only other library in the project will be the SDWebImageSwiftUI that handles the async image download, to save up quite some time and plus its core which is written in Objective-C is trusted by several companies.

## CI Environment:
The `GITHUB_TOKEN` can be removed to set up a static Github Token.
Or even easier, you could use the environment variables to pass it on.
Just go to GithubQL -> Edit Scheme -> Environment Variables and set
the value of `GITHUB_TOKEN`.

## SwiftUI Extensions:
In the project I included various SwiftUI Extension Snippets that are used across the project, such as `ActivityIndicator`, `RetryButton`, `SafeVStack` and `IgnoringSafeArea` 
Follow me on twitter for more Snippets like these ones.
<a href="https://twitter.com/JC_Tec_">@JC_Tec_</a>
