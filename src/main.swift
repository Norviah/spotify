//
//  main.swift
//  spotify
//
//  Created by Norviah on 8/10/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser
import Foundation

/// The main interface for the command line.
struct Interface: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // The name of the command to use on the command line.
    commandName: "spotify",

    // Optional abstracts and discussions are used for help output.
    abstract: "A command line interface for Spotify.",

    // The current version for this tool.
    // TODO: Find a way to get the version from version.txt.
    version: "v1.1.1",

    // An array of subcommands for the cli.
    subcommands: [Play.self, Skip.self, Prev.self, Replay.self, Quit.self, Pause.self, Vol.self, Toggle.self, Get.self, Jump.self, Lyrics.self]
  )
}

// Before continuing, ensure that the user has Spotify installed.
guard Spotify.Installed else {
  raise(error: "Spotify must be installed to use this tool.")
}

/// Represents if Spotify is currently open.
let running: Bool = Spotify.Open()

// If spotify isn't open it, we'll tell it to open.
// TODO: Figure out how to open an app in the background, without focusing
// on the app if it's opened in another Desktop space.
if !running {
  Spotify.Tell(to: "open")
}

Interface.main()
