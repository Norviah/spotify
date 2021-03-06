//
//  Play.swift
//  spotify
//
//  Created by Norviah on 8/10/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Play: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Play different types of media based off of names.",

    // A more longer description for this command.
    discussion: "If no subcommands are provided, playback for the current track is resumed.",

    // An array of subcommands for this command.
    subcommands: [Album.self, Track.self, List.self, Artist.self, URI.self]
  )

  /// Resumes playback where Spotify last left off.
  func run() {
    Spotify.Tell(to: "play")
  }
}
