//
//  GetRepeat.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetRepeat: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "repeat",

    // Optional abstracts and discussions are used for help output.
    abstract: "Displays whether repeat is enabled."
  )

  /// Prints if repeating is enabled.
  func run() {
    print(Spotify.Get(key: "repeating") ?? "[unknown]")
  }
}
