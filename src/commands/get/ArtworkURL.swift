//
//  ArtworkURL.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct ArtworkURL: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Gets the URL for the current track's album art."
  )

  /// Prints the URL for the current track's album art.
  func run() {
    print(Spotify.Track.ArtworkURL ?? "[unknown]")
  }
}
