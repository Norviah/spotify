//
//  To.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct To: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Jumps to the given time (in seconds) in the current track."
  )

  /// The position of where to set the current track to.
  @Argument(help: "The position of where to set the current track to.")
  var position: Int

  /// Ensures that given arguments are valid.
  /// - Throws: An error if the user provides an invalid argument.
  mutating func validate() throws {
    guard self.position >= 0 else {
      throw ValidationError("Please provide an amount greater than or equal to 0.")
    }
  }

  /// Skips to the given time in the current track.
  func run() {
    // We'll get the duration of the current track to ensure that the user has
    // set a time less than or equal to the current track's duration, and, we'll
    // ensure that Spotify is currently playing a track.
    guard let amount = Spotify.Track.Duration, let duration = Int(amount) else {
      raise(error: "Spotify isn't currently playing a track.")
    }

    // Ensure that a valid position is given.
    guard self.position <= duration else {
      raise(error: "The given position \(self.position) is out of bounds, as the current track is \(duration / 1000) seconds long.")
    }

    Spotify.Set(key: "player position", to: String(self.position))
  }
}
