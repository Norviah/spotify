//
//  Raise.swift
//  spotify
//
//  Created by Norviah on 8/14/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Prints the given error to the console and quits the program.
/// - Parameter error: The error to raise.
func raise(error: String) -> Never {
  print("Error: \(error)")

  // We'll return with a status of 1 to indicate that we had manually
  // ended the program, instead of the program ending for an unknown reason.
  return exit(1)
}
