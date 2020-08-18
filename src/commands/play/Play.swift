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
    abstract: "Searches and plays an artist, track, album, or playlist.",

    // A more longer description for this command.
    discussion: "If no subcommands are provided, playback for the current track is resumed.",

    // Pass an array to `subcommands` to set up a nested tree of subcommands.
    // With language support for type-level introspection, this could be
    // provided by automatically finding nested `ParsableCommand` types.
    subcommands: [Album.self, Track.self, List.self, Artist.self, URI.self]
  )

  /// Resumes playback where Spotify last left off.
  func run() {
    Spotify.Tell(to: "play")
  }
}
