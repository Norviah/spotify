//
//  Track.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Track: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Finds and plays the given track."
  )

  /// The name of the track to play.
  @Argument(help: "The name of the track.")
  var name: [String] = []

  /// Determines the limit on the amount of options to consider.
  @Option(help: "How many options do you want to consider when searching [1-50]?")
  var limit: Int = 1

  /// Ensures that given arguments are valid.
  /// - Throws: An error if the user provides an invalid argument.
  mutating func validate() throws {
    // Ensure that the user has given a name to search for.
    guard !self.name.isEmpty else {
      throw ValidationError("Please provide a name.")
    }

    // Ensure that a valid limit is given.
    guard self.limit > 0, self.limit <= 50 else {
      throw ValidationError("Please provide a limit from 1 to 50.")
    }
  }

  /// Tries to find a track with the given name and plays it.
  func run() {
    // Using Spotify's API and the user's tokens, we'll try to find
    // a track with the given name and get the track's URI.
    guard let URI = API().Search(type: .TRACK, query: self.name.joined(separator: " "), limit: self.limit) else {
      raise(error: "The track '\(self.name.joined(separator: " "))' wasn't found.")
    }

    // If a track is found, we'll play it.
    Spotify.Tell(to: "play track \"\(URI)\"")
  }
}
