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
    abstract: "Controls Spotify's volume.",

    // A more longer description for this command.
    discussion: "If no subcommands are provided, the current volume amount will be printed.",

    // Pass an array to `subcommands` to set up a nested tree of subcommands.
    // With language support for type-level introspection, this could be
    // provided by automatically finding nested `ParsableCommand` types.
    subcommands: [Up.self, Down.self, Set.self]
  )

  /// Prints the current volume for Spotify.
  func run() {
    print(Spotify.Get(key: "sound volume") ?? "[unknown]")
  }
}
