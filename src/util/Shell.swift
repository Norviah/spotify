//
//  Shell.swift
//  spotify
//
//  Created by Norviah on 8/12/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import Foundation

/// Executes the given string as a shell script.
/// - Parameter source: The string to execute.
/// - Returns: The result of the execution.
func shell(script: String) -> String {
  // Initialize a new subprocess of the main process.
  let process: Process = Process()

  // When initializing a new Process instance, that instance
  // inherits values from the main process that launched it, so
  // we must change some values of the initialized instance.

  // First, we'll initialize and set a new Pipe instance so
  // the subprocess and main process can communicate.
  let pipe: Pipe = Pipe()
  process.standardOutput = pipe

  // Set the subprocess' arguments to the '-c' flag, which represents
  // the command flag, which will execute whatever arguments it's given
  // as a command, which we do by having the given parameters as a value.
  process.arguments = ["-c", script]

  // Here we set the launch path of the subprocess to the absolute location
  // of bash's executable file, then we launch it.
  process.launchPath = "/bin/bash"
  process.launch()

  // After the process has finished executing the command, we'll read the
  // result of the execution and store it in a variable.
  let data: Data = pipe.fileHandleForReading.readDataToEndOfFile()

  // The output is saved as a Data object, so we have to convert it into a string.
  let output = String(data: data, encoding: .utf8)!

  return output
}
