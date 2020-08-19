//
//  ID.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct ID: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Displays the current track's ID."
  )

  /// Prints the current track's ID.
  func run() {
    print(Spotify.Track.ID ?? "[unknown]")
  }
}
