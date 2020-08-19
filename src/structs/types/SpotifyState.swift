//
//  SpotifyState.swift
//  spotify
//
//  Created by Norviah on 8/19/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// Represents a list of states that Spotify can be in.
enum SpotifyState: String {
  /// Represents that Spotify is currently playing a track.
  case PLAYING
  
  /// Represents that no track is playing and Spotify doesn't
  /// have a track active.
  case STOPPED
  
  /// Represents that a track is active but is currently paused.
  case PAUSED
}
