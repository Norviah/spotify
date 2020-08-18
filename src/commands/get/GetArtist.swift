//
//  GetArtist.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetArtist: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "artist",

    // Optional abstracts and discussions are used for help output.
    abstract: "Gets the artist of the current track."
  )

  /// Prints the artist of the current track.
  func run() {
    print(Spotify.Track.Artist ?? "[unknown]")
  }
}
