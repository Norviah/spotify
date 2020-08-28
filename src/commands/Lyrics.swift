//
//  Lyrics.swift
//  spotify
//
//  Created by Norviah on 8/19/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Lyrics: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Finds lyrics for the current track.",

    // A more longer description for this command.
    discussion: "This command won't necessarily find the lyrics for the current track as it uses https://makeitpersonal.co/ to find lyrics. They don't have lyrics for most, atleast relatively new, tracks, albeit it is free and doesn't require an application."
  )

  /// Ensures that Spotify has a track active.
  func validate() throws {
    guard Spotify.State != .STOPPED else {
      raise(error: "Spotify doesn't have a track playing or paused.")
    }
  }

  /// Finds and displays lyrics for the current track.
  func run() {
    /// The name of the current track.
    let name: String = Spotify.Track.Name!

    /// The name of the artist.
    let artist: String = Spotify.Track.Artist!

    let query: [String: String] = [
      "title": name,
      "artist": artist,
    ]

    // TODO: Find a better API for lyrics, preferably one that is free and doesn't require an application.

    /// We'll use https://makeitpersonal.co to try to find lyrics, from my experience, they don't
    /// have the lyrics of a lot of, atleast relatively recent, tracks, but, it is free and
    /// doesn't require users to create an application so it'll work for now.
    let lyrics: String = request(url: "https://makeitpersonal.co/lyrics", method: .GET, headers: nil, body: nil, query: query)

    guard lyrics != "Sorry, We don't have lyrics for this song yet. Add them to https://lyrics.wikia.com" else {
      raise(error: "No lyrics for the current track could be found.")
    }

    print(lyrics.trimmingCharacters(in: .whitespacesAndNewlines))
  }
}
