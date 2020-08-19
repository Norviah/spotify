//
//  Shuffle.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Shuffle: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Toggle or set shuffle."
  )

  /// The value to set shuffling to.
  @Argument(help: "The value to set to.")
  var value: Bool = !(Spotify.Get(key: "shuffling") == "true")

  /// Toggles shuffle for the current track.
  func run() {
    Spotify.Set(key: "shuffling", to: String(self.value))
  }
}
