//
//  paths.swift
//  spotify
//
//  Created by Norviah on 8/12/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Consists of absolute URLs/paths for commonly used
/// for files/directories used in this project.
struct Paths {
  /// Represents the URL for the path for the user's home directory.
  static let HOME: URL = FileManager.default.homeDirectoryForCurrentUser

  /// Represents the URL for the path for the config file.
  static let CONFIG: URL = Paths.HOME.appendingPathComponent(".spotify")

  /// Private constructor so it's impossible to initialize
  /// an instance of this structure.
  private init() {}
}
