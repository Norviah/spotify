//
//  Volume.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Vol: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Control Spotify's volume.",

    // A more longer description for this command.
    discussion: "If no subcommands are provided, the current volume amount will be printed.",

    // An array of subcommands for this command.
    subcommands: [Up.self, Down.self, Set.self]
  )

  /// Prints the current volume for Spotify.
  func run() {
    print(Spotify.Get(key: "sound volume") ?? "[unknown]")
  }
}
