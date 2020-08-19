//
//  Jump.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Jump: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Jump to specific parts of the current track.",

    // An array of subcommands for this command.
    subcommands: [To.self, Forward.self, Backward.self]
  )
}
