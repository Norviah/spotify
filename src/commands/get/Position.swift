//
//  Position.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Position: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Gets the current position in the current track (in seconds)."
  )

  /// Prints the artist of the current track.
  func run() {
    print(Spotify.Get(key: "player position", type: "integer") ?? "[unknown]")
  }
}
