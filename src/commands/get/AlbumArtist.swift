//
//  AlbumArtist.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct AlbumArtist: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Gets the artist of the album the current track is from."
  )

  /// Prints the artist of the album that the current track is from.
  func run() {
    print(Spotify.Track.AlbumArtist ?? "[unknown]")
  }
}
