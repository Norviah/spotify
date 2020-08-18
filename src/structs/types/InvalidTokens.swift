//
//  InvalidTokens.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// Represents the structure of the response from Spotify's API
/// when an error occurred when trying to generate tokens.
struct InvalidTokens: Decodable {
  /// The reason of why the error had occurred.
  var error: String

  /// An optional description detailing more of the error.
  var error_description: String?
}
