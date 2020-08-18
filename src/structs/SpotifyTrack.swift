//
//  SpotifyTrack.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// References information about the current playing track.
public struct SpotifyTrack {
  /// The artist of the current playing track.
  public var Artist: String? { self.Get(key: "artist") }

  /// The album that the current track is from.
  public var Album: String? { self.Get(key: "album") }

  /// The disc number of the track.
  public var DiskNumber: String? { self.Get(key: "disc number") }

  /// The length of the track in seconds.
  public var Duration: String? { self.Get(key: "duration", type: "integer") }

  /// The number of times this track has been played.
  public var PlayedCount: String? { self.Get(key: "played count") }

  /// The index of the track in its album.
  public var TrackNumber: String? { self.Get(key: "track number") }

  /// How popular is this track from 0-100.
  public var Popularity: String? { self.Get(key: "popularity") }

  /// The ID of the item.
  public var ID: String? { self.Get(key: "id")?.replacingOccurrences(of: "spotify:track:", with: "") }

  /// The name of the track.
  public var Name: String? { self.Get(key: "name") }

  /// The URL of the track's album cover.
  public var ArtworkURL: String? { self.Get(key: "artwork url") }

  /// That album artist of the track.
  public var AlbumArtist: String? { self.Get(key: "album artist") }

  /// The URI of the track.
  public var URI: String? { self.Get(key: "spotify url") }

  /// Initializes a new SpotifyTrack instance.
  public init() {}

  /// Gets a value from the current playing track.
  /// - Parameter key: The key to get.
  ///   - type: The optional type to cast the value to.
  /// - Returns: The value from the current playing track.
  private func Get(key: String, type: String? = nil) -> String? {
    Spotify.Get(key: key, from: "current track", type: type)
  }
}
