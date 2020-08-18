//
//  SearchOptions.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// Represents the types of Searches that is supported.
enum SearchOptions: String {
  /// Used to search for an album.
  case ALBUM = "album"

  /// Used to search for a track.
  case TRACK = "track"

  /// Used to search for an artist.
  case ARTIST = "artist"

  /// Used to search for a playlist.
  case LIST = "playlist"

  /// When using a value from Enums, the values are uppercased,
  /// so we'll have a property to represent the value in all lowercase.
  var lower: String {
    rawValue.lowercased()
  }
}
