//
//  Length.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Length: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Displays the length of the current track (in seconds)."
  )

  /// Gets the length for the current track in seconds.
  func run() {
    print(Spotify.Track.Duration != nil ? Int(Spotify.Track.Duration!)! / 1000 : "[unknown]")
  }
}
