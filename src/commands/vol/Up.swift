//
//  Up.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Up: ParsableCommand {
  // Optional abstracts and discussions are used for help output.
  static let configuration: CommandConfiguration = CommandConfiguration(
    abstract: "Increases the volume by 10%."
  )

  /// Increates the volume by 10%.
  func run() {
    Spotify.Set(key: "sound volume", to: String(Int(Spotify.Get(key: "sound volume")!)! + 10))
  }
}
