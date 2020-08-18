//
//  Replay.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Replay: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Replays the current track from the beginning."
  )

  /// Replays the current track to the beginning.
  func run() {
    Spotify.Set(key: "player position", to: "0")
  }
}
