//
//  Match.swift
//  spotify
//
//  Created by Norviah on 8/18/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// Returns an array consisting of substrings that match the given pattern in the given string.
/// - Parameters:
///   - pattern: The regular expression to look for.
///   - string: The string to find matches in.
/// - Returns: An array of matches in the given string.
func match(pattern: String, string: String) -> [Substring] {
  /// Represents the array of matches.
  var matches: [Substring] = []

  /// Determines the starting index to look for matches.
  var index: String.Index = string.startIndex

  while let range = string[index...].range(of: pattern, options: .regularExpression) {
    // While the string still has matches which match the given pattern,
    // we'll append the match into the array.
    matches.append(string[range])

    // And update the index to reflect the new position.
    index = range.upperBound
  }

  return matches
}
