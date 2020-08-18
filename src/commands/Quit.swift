//
//  Quit.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Quit: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Quits Spotify."
  )

  /// Quits Spotify.
  func run() {
    Spotify.Tell(to: "quit")
  }
}
