//
//  Prev.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Prev: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Plays the previous track."
  )

  /// Returns to the previous track.
  func run() {
    Spotify.Tell(scripts: ["set player position to 0", "previous track"])
  }
}
