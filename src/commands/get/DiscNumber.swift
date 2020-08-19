//
//  DiscNumber.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct DiscNumber: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Displays the disc number of the current track."
  )

  /// Prints the disc number of the current track.
  func run() {
    print(Spotify.Track.DiskNumber ?? "[unknown]")
  }
}
