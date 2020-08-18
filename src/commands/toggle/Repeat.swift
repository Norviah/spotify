//
//  Repeat.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Repeat: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Toggle or set repeat for the current track."
  )

  /// The value to set repeat to.
  @Argument(help: "The value to set to.")
  var value: Bool = !(Spotify.Get(key: "repeating") == "true")

  /// Toggles repeat for the current track.
  func run() {
    Spotify.Set(key: "repeating", to: String(self.value))
  }
}
