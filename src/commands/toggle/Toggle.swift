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
    abstract: "Toggle or set various aspects of the current track.",

    // Pass an array to `subcommands` to set up a nested tree of subcommands.
    // With language support for type-level introspection, this could be
    // provided by automatically finding nested `ParsableCommand` types.
    subcommands: [Playback.self, Shuffle.self, Repeat.self]
  )
}
