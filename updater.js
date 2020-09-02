const { execSync } = require("child_process")

/**
 * Reads the contents of the version file, as we aren't really
 * doing anything with it, we'll simply return it.
 * @param  contents The current version of the project.
 * @return          The current version of the project.
 */
function readVersion(contents) {
  return contents;
}

/**
 * As standard-version already bumps the version and tags the project, we'll
 * simply use this function to update the actual version for the command line interface.
 * @param  current  The current version of the project.
 * @param  version  The bumped up version of the project.
 * @return          The bumped up version of the project.
 */
function writeVersion(current, version) {
  // Set the new version of the project within the main script for this project.
  execSync(`sed -i '' 's/${current.trim()}/${version.trim()}/g' ./src/main.swift`);

  // We have to return the new version, as standard-version will overwrite the
  // version file with the new bumped version.
  return version;
}

module.exports = { readVersion, writeVersion }
