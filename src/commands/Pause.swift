//
//  Pause.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Pause: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Pauses playback of the current track."
  )

  /// Pauses playback of the current trask.
  func run() {
    Spotify.Tell(to: "pause")
  }
}
