//
//  State.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct State: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Displays Spotify's current state: paused, stopped, or playing."
  )

  /// Prints the artist of the current track.
  func run() {
    print(Spotify.State)
  }
}
