//
//  Toggle.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Toggle: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Toggle or set various aspects of Spotify.",

    // An array of subcommands for this command.
    subcommands: [Playback.self, Shuffle.self, Repeat.self]
  )
}
