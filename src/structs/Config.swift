//
//  Config.swift
//  spotify
//
//  Created by Norviah on 8/11/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Loads the user's API tokens from the config file.
struct Config: Decodable {
  /// Represents the user's ID token for Spotify's API.
  public var CLIENT_ID: String = ""

  /// Represents the user's SECRET token for Spotify's API.
  public var CLIENT_SECRET: String = ""

  /// Represents the default format for the config file for this tool.
  private let defaults: String = """
  {
    "CLIENT_ID": "[token]",
    "CLIENT_SECRET": "[token]"
  }
  """

  /// Represents an example for the config file.
  private let example: String = """
  {
    "CLIENT_ID": "1as2d3a4s5gr67th8ref7asf6awfe5fe",
    "CLIENT_SECRET": "1as2d3a4s5gr67th8ref7asf6awfe5fe"
  }
  """

  /// Initializes a new Config instance.
  init() {
    /// Determines if the user has a config file saved to the home directory.
    let exists: Bool = FileManager.default.fileExists(atPath: Paths.CONFIG.path)

    // If a config file doesn't exist, we'll create one for them and inform them
    // to properly fill in the values for their ID and SECRET token.
    guard exists else {
      self.create()
    }

    do {
      try self.load()
    }

    // If an error occurs, we'll inform the user on the proper format for the
    // config file, and then quit the program.
    catch {
      raise(error: "An error occurred while trying to read the config file at: \(Paths.CONFIG.path), please ensure that this file is in the format of:\n\(self.defaults)\n\nFor example:\n\(self.example)")
    }
  }

  /// Loads the config file into a local variable and assigns the user's
  /// ID and SECRET token to this Config instance.
  private mutating func load() throws {
    // We know that the user has a config file saved, so we'll try to
    // load the data from that file into a variable.
    let json: Data = try! String(contentsOf: Paths.CONFIG).data(using: .utf8)!

    // The config file is essentially a JSON file with the tokens saved as an element,
    // so we'll initialize a new instance of a JSON decoder in order to decode the
    // file as a JSON object and initialize a Dictionary.
    let decoder: JSONDecoder = JSONDecoder()

    // Try decoding the config file as a Dictionary using the Config structure as
    // a base. The best part of using this decoder is that if the JSON file isn't
    // valid JSON or doesn't have the public members of Config, then an error is
    // raised, so it's ensured that the user has values for the ID and SECRET.
    let data: Config = try decoder.decode(Config.self, from: json)

    // Since we know that the JSON is valid with the appropiate values, we'll set
    // them to this Config instance.
    self = data
  }

  /// Creates a config file for the user in their home directory and informs them
  /// of how to set these values from Spotify's API.
  private func create() -> Never {
    do {
      try self.defaults.write(to: Paths.CONFIG, atomically: false, encoding: .utf8)
    }

    // If an error occurs while trying to create a config file, we'll inform the user
    // and ask them to manually create this file, or, to try again.
    catch {
      return raise(error: "An error occurred when creating a config file at: \(Paths.CONFIG.path), please try again or create this file manually.")
    }

    // Informs the user that in order to use the desired command, they need tokens.
    return raise(error: "In order to use this command, you need to have an ID and SECRET token from Spotify's API, please set these values in: \(Paths.CONFIG.path).")
  }
}
