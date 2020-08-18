//
//  applescript.swift
//  spotify
//
//  Created by Norviah on 8/10/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Executes the given string as AppleScript.
/// - Parameter source: The script to execute.
/// - Returns: The result of the execution.
@discardableResult
func AppleScript(source: String) -> String? {
  NSAppleScript(source: source)?.executeAndReturnError(nil).stringValue
}
