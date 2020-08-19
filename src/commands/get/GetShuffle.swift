//
//  GetShuffle.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetShuffle: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "shuffle",

    // Optional abstracts and discussions are used for help output.
    abstract: "Displays whether shuffle is enabled."
  )

  /// Prints if shuffle is enabled.
  func run() {
    print(Spotify.Get(key: "shuffling") ?? "[unknown]")
  }
}
