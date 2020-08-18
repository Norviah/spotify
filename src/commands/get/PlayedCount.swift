//
//  PlayedCount.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct PlayedCount: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Gets the amount of times the current track has been played."
  )

  /// Prints the amount of times the current track has been played.
  func run() {
    print(Spotify.Track.PlayedCount ?? "[unknown]")
  }
}
