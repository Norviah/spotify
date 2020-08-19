//
//  Popularity.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Popularity: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Displays a value ranging from 0 to 100 representing how popular the current track is."
  )

  /// Prints a value representing how popular the current track is.
  func run() {
    print(Spotify.Track.Popularity ?? "[unknown]")
  }
}
