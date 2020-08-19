//
//  GetURI.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetURI: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "uri",

    // Optional abstracts and discussions are used for help output.
    abstract: "Displays the URI of the current track."
  )

  /// Prints the URI of the current track.
  func run() {
    print(Spotify.Track.URI ?? "[unknown]")
  }
}
