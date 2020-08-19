//
//  Playback.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Playback: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Toggle or set playback of the current track."
  )

  /// The value to set playback to.
  @Argument(help: "The value to set to.")
  var value: Bool = !(Spotify.State == "playing")

  /// Toggles playback for the current track.
  func run() {
    Spotify.Tell(to: self.value ? "play" : "pause")
  }
}
