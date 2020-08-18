//
//  scopes.swift
//  spotify
//
//  Created by Norviah on 8/18/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// A list of scopes that Spotify supports.
/// Documentation: https://developer.spotify.com/documentation/general/guides/scopes/
enum Scopes: String, CaseIterable {
  // ---
  // Images
  // ---

  /// Description: Write access to user-provided images.
  /// Visible to users: Upload images to Spotify on your behalf.
  case UGCImageUpload = "ugc-image-upload"

  // ---
  // Spotify Connect
  // ---

  /// Description: Read access to a user’s player state.
  /// Visible to users: Read your currently playing content and Spotify Connect devices information.
  case UserReadPlaybackState = "user-read-playback-state"

  /// Description: Write access to a user’s playback state.
  /// Visible to users: Control playback on your Spotify clients and Spotify Connect devices.
  case UserModifyPlaybackState = "user-modify-playback-state"

  /// Description: Read access to a user’s currently playing content.
  /// Visible to users: Read your currently playing content.
  case UserReadCurrentlyPlaying = "user-read-currently-playing"

  // ---
  // Playback
  // ---

  /// Description: Control playback of a Spotify track. This scope is currently available to the Web Playback SDK. The user must have a Spotify Premium account.
  /// Visible to users: Play content and control playback on your other devices.
  case Streaming = "streaming"

  /// Description: Remote control playback of Spotify. This scope is currently available to Spotify iOS and Android SDKs.
  /// Visible to users: Communicate with the Spotify app on your device.
  case AppRemoteControl = "app-remote-control"

  // ---
  // Users
  // ---

  /// Description: Read access to user’s email address.
  /// Visible to users: Get your real email address.
  case UserReadEmail = "user-read-email"

  /// Description: Read access to user’s subscription details (type of user account).
  /// Visible to users: Access your subscription details.
  case UserReadPrivate = "user-read-private"

  // ---
  // Playlists
  // ---

  /// Description: Include collaborative playlists when requesting a user's playlists.
  /// Visible to users: Access your collaborative playlists.
  case PlaylistReadCollaborative = "playlist-read-collaborative"

  /// Description: Write access to a user's public playlists.
  /// Visible to users: Manage your public playlists.
  case PlaylistModifyPublic = "playlist-modify-public"

  /// Description: Read access to user's private playlists.
  /// Visible to users: Access your private playlists.
  case PlaylistReadPrivate = "playlist-read-private"

  /// Description: Write access to a user's private playlists.
  /// Visible to users: Manage your private playlists.
  case PlaylistModifyPrivate = "playlist-modify-private"

  // ---
  // Library
  // ---

  /// Description: Write/delete access to a user's "Your Music" library.
  /// Visible to users: Manage your saved content.
  case UserLibraryModify = "user-library-modify"

  /// Description: Read access to a user's "Your Music" library.
  /// Visible to users: Access your saved content.
  case UserLibraryRead = "user-library-read"

  // ---
  // Listening History
  // ---

  /// Description: Read access to a user's top artists and tracks.
  /// Visible to users: Read your top artists and content.
  case UserTopRead = "user-top-read"

  /// Description: Read access to a user’s playback position in a content.
  /// Visible to users: Read your position in content you have played.
  case UserReadPlaybackPosition = "user-read-playback-position"

  /// Description: Read access to a user’s recently played tracks.
  /// Visible to users: Access your recently played items.
  case UserReadRecentlyPlayed = "user-read-recently-played"

  // ---
  // Follow
  // ---

  /// Description: Read access to the list of artists and other users that the user follows.
  /// Visible to users: Access your followers and who you are following.
  case UserFollowRead = "user-follow-read"

  /// Description: Write/delete access to the list of artists and other users that the user follows.
  /// Visible to users: Manage who you are following.
  case UserFollowModify = "user-follow-modify"
}
