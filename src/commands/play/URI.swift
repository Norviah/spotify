//
//  URI.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct URI: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Plays the given URI."
  )

  /// The URI to play.
  @Argument(help: "The URI to play.")
  var URI: String

  /// Ensures that given arguments are valid.
  /// - Throws: An error if the user provides an invalid argument.
  mutating func validate() throws {
    // Make sure a valid URI is given.
    let valid: Bool = self.URI.range(of: "^spotify:\\w+:[A-Za-z0-9]+$", options: .regularExpression) != nil

    guard valid else {
      throw ValidationError("\(self.URI) isn't a valid URI.")
    }
  }

  /// Plays the given URI.
  func run() {
    Spotify.Tell(to: "play track \"\(self.URI)\"")
  }
}
