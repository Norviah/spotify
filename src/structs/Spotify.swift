//
//  Spotify.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

/// A simple module to talk to Spotify via AppleScript.
struct Spotify {
  /// Represents the state that Spotify is in (paused/stopped/playing).
  public static let State: String? = Get(key: "player state", type: "string")

  /// Represents information for the current playing track.
  public static let Track: SpotifyTrack = SpotifyTrack()

  /// Set the constructor to private so an AppleScript
  /// instance can't accidentally be initialized.
  private init() {}

  /// Determines if Spotify is currently open.
  /// - Returns: A Bool value representing if Spotify is open.
  public static func Open() -> Bool {
    AppleScript(source: "application \"Spotify\" is running") == "true"
  }

  /// Executes the given AppleScript to make Spotify do something.
  /// - Parameter script: The script to tell Spotify.
  /// - Returns: The response of the script.
  @discardableResult
  public static func Tell(to: String) -> String? {
    AppleScript(source: "tell application \"Spotify\" to \(to)")
  }

  /// Executes multple AppleScripts to make Spotify do something in succession.
  /// - Parameter script: The multiple scripts to tell Spotify.
  /// - Returns: An array consisting of the responses of each script.
  @discardableResult
  public static func Tell(scripts: [String]) -> [String?] {
    scripts.map { self.Tell(to: $0) }
  }

  /// Informs Spotify via an AppleScript to set a value.
  /// - Parameter script: The script to execute.
  /// - Returns: The response of the script.
  @discardableResult
  public static func Set(key: String, to: String) -> String? {
    self.Tell(to: "set \(key) to \(to)")
  }

  /// Gets a value from Spotify.
  /// - Parameters:
  ///   - key: The key to get.
  ///   - type: The optional type to cast the value to.
  /// - Returns: The value for the key.
  public static func Get(key: String, type: String? = nil) -> String? {
    self.Tell(to: "get \(key) \(type != nil ? "as \(type!)" : "")")
  }

  /// Gets a value from a specific object from Spotify.
  /// - Parameters:
  ///   - key: The key to get.
  ///   - from: The object to get the key from.
  ///   - type: The optional type to cast the value to.
  /// - Returns: The value from the object.
  public static func Get(key: String, from: String, type: String? = nil) -> String? {
    self.Tell(to: "get \(key) of \(from) \(type != nil ? "as \(type!)" : "")")
  }
}
