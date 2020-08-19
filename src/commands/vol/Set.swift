//
//  Set.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Set: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Sets the volume to the given amount [0-100]."
  )

  /// The amount to set Spotify's volume to.
  @Argument(help: "The amount to set Spotify's volume to [0-100].")
  var amount: Int

  /// Ensures that given arguments are valid.
  /// - Throws: An error if the user provides an invalid amount.
  mutating func validate() throws {
    guard self.amount >= 0, self.amount <= 100 else {
      throw ValidationError("Please provide an amount from 0 to 100.")
    }
  }

  /// Sets Spotify's volume to the given amount.
  func run() {
    Spotify.Set(key: "sound volume", to: String(self.amount))
  }
}
