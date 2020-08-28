//
//  Backward.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Backward: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Jumps behind (in seconds) in the current track."
  )

  /// The amount to jump behind.
  @Argument(help: "The amount (in seconds) to jump.")
  var amount: Int = 15

  /// Ensures that given arguments are valid.
  /// - Throws: An error if the user provides an invalid argument.
  mutating func validate() throws {
    guard self.amount >= 0 else {
      throw ValidationError("Please provide an amount greater than or equal to 0.")
    }
  }

  /// Jumps behind the given amount in the given track.
  func run() {
    // We'll get the duration of the current track to ensure
    // that Spotify is currently playing a track.
    guard let amount = Spotify.Track.Duration, let _ = Int(amount) else {
      raise(error: "Spotify isn't currently playing a track.")
    }

    // Once we're sure that a track is playing, we'll get the player position and
    // cast it as an integer, as if you don't, a floating number will be used.
    let position: Int = Int(Spotify.Get(key: "player position", type: "integer")!)!

    Spotify.Set(key: "player position", to: String(position - self.amount))
  }
}
