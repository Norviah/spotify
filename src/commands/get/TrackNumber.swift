//
//  TrackNumber.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct TrackNumber: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Gets the index of the current track from it's album."
  )

  /// Prints the position of the current track from it's album.
  func run() {
    print(Spotify.Track.TrackNumber ?? "[unknown]")
  }
}
