//
//  api.swift
//  spotify
//
//  Created by Norviah on 8/12/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// This structure is how we'll communicate with Spotify's API.
struct API: Decodable {
  /// Represents the access token for the user's tokens.
  public var access_token: String

  /// Represents the token type for the user's credentials.
  public var token_type: String

  /// Represents how long until the access token expires.
  public var expires_in: Int

  /// Represents the scopes that are valid for the access token.
  public var scope: String

  /// Initializes a new API instance and calls Spotify's
  /// API to generate tokens for the application.
  init() {
    let config: Config = Config()

    // Before we can authorize this application with Spotify's API, we do need an ID and SECRET token,
    // but we'll also need to combine these two values together and encode the result.
    let credentials: String = Data("\(config.CLIENT_ID):\(config.CLIENT_SECRET)".utf8).base64EncodedString()

    // Represents the headers we'll use when calling Spotify's API for tokens.
    let headers: [String: String] = [
      "Authorization": "Basic \(credentials)",
    ]

    // We'll send a request to the API with the given properties to generate tokens for this application.
    let response: String = request(url: "https://accounts.spotify.com/api/token", method: .POST, headers: headers, body: "grant_type=client_credentials")

    // As the response is a string, in order to cast it into a dictionary, we'll use a JSONDecoder instance.
    let decoder: JSONDecoder = JSONDecoder()

    // In order to cast the response into a dictionary, we have to initialize a new Data object from the string.
    let json: Data = response.data(using: .utf8)!

    let data: API? = try? decoder.decode(API.self, from: json)

    if data == nil {
      // If an error occurred, it represents that the user's tokens are invalid, so we'll
      // cast it into InvalidClient in order to get the reason why.
      let data: InvalidTokens = try! decoder.decode(InvalidTokens.self, from: json)

      raise(error: "An error was thrown from Spotify's API: \(data.error), ensure that your tokens are valid here: \(Paths.CONFIG.path).")
    }

    self = data!
  }

  /// Uses Spotify's API to search for a query of the given type.
  /// - Parameters:
  ///   - type: The type to search for.
  ///   - query: The query to search for.
  ///   - limit: Represents how many options Spotify's API should consider.
  /// - Returns: The URI of the query if one was found, otherwise, nil.
  public func Search(type: SearchOptions, query: String, limit: Int = 1) -> Substring? {
    // Represents the headers we'll use to authorize this application.
    let headers: [String: String] = [
      "Authorization": "Bearer \(self.access_token)",
    ]

    // Represents a list of query items we'll use to search for the given item.
    let query: [String: String] = ["type": type.lower, "limit": String(limit), "q": query]

    let response: String = request(url: "https://api.spotify.com/v1/search", method: .GET, headers: headers, body: nil, query: query)

    // The response from the API will be a JSON string containing information
    // about each item found, we'll use a regular expression to initialize an
    // array containing the URI of each found item.
    let matches: [Substring] = match(pattern: "spotify:\(type.lower):[a-zA-Z0-9]+", string: response)

    if matches.count == 0 {
      return nil
    }

    return matches[0]
  }
}
