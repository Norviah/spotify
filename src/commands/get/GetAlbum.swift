//
//  GetAlbum.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct GetAlbum: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the subcommand.
    commandName: "album",

    // Optional abstracts and discussions are used for help output.
    abstract: "Displays the name of the album the current track is from."
  )

  /// Prints the album of the current track.
  func run() {
    print(Spotify.Track.Album ?? "[unknown]")
  }
}
