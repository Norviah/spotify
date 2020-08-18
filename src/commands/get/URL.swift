//
//  URL.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetURL: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "url",

    // Optional abstracts and discussions are used for help output.
    abstract: "Gets the URL of the current track."
  )

  /// Prints the URL for the current track.
  func run() {
    print(Spotify.Track.ID != nil ? "https://open.spotify.com/track/\(Spotify.Track.ID!)" : "[unknown]")
  }
}
