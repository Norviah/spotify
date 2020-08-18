//
//  Skip.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Skip: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Skips to the next track."
  )

  /// Skips the current playing track.
  func run() {
    Spotify.Tell(to: "next track")
  }
}
