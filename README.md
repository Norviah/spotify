## spotify

A command line interface used to control Spotify for OS X, `spotify` uses AppleScript to set and get values to and from Spotify.

### Installation

```bash
brew install norviah/formulae/spotify

# brew may not link spotify to your PATH if you have installed Spotify
# via brew cask, to fix this, run this command:
brew link spotify
```

### API

In order to use the subcommands `album`, `artist`, `list`, and `song` for the command `play`; you need to create and register an application with [Spotify's API](https://developer.spotify.com/my-applications/#!/applications/create).

Once you have created an application, get your ID and SECRET token and save them in the config file: `$HOME/.spotify`. The config file has to be JSON with the format being:

```
{
  "CLIENT_ID": "[token]",
  "CLIENT_SECRET": "[token]"
}
```

For example:

```
{
  "CLIENT_ID": "1as2d3a4s5gr67th8ref7asf6awfe5fe",
  "CLIENT_SECRET": "1as2d3a4s5gr67th8ref7asf6awfe5fe"
}
```

### Usage

[*] represents a command that requires [Spotify's API](https://developer.spotify.com/my-applications/#!/applications/create).

```
spotify play                                                 Resumes playback for the current track.
spotify play album   <name>  [--limit <1-50>] (default: 1)   Finds and plays the given album. [*]
spotify play song    <name>  [--limit <1-50>] (default: 1)   Finds and plays the given track. [*]
spotify play list    <name>  [--limit <1-50>] (default: 10)  Finds and plays the given playlist. [*]
spotify play artist  <name>  [--limit <1-50>] (default: 1)   Finds and plays the given artist. [*]
spotify uri <uri>                                            Plays the given URI.

spotify vol                                                  Prints the current volume.
spotify vol up                                               Increases the volume by 10%.
spotify vol down                                             Decreases the volume by 10%.
spotify vol set <0-100>                                      Sets Spotify's volume to the given amount [0-100].

spotify toggle playback  [bool]                              Toggle or set playback for the current track.
spotify toggle shuffle   [bool]                              Toggle or set shuffle for the current track.
spotify toggle repeat    [bool]                              Toggle or set repeat for the current track.

spotify jump to        <position>                            Jumps to the given time (in seconds) in the current track.
spotify jump forward   [position] (default: 15)              Jumps ahead (in seconds) in the current track.
spotify jump backward  [position] (default: 15)              Jumps behind (in seconds) in the current track.

spotify get artist                                           Gets the artist of the current track.
spotify get album                                            Gets the name of the album the current track is from.
spotify get album-artist                                     Gets the artist of the album the current track is from.
spotify get disc-number                                      Gets the disc number of the current track.
spotify get length                                           Gets the length for the current track (in seconds).
spotify get played-count                                     Gets the amount of times the current track has been played.
spotify get track-number                                     Gets the index of the current track from it's album.
spotify get popularity                                       Gets a value ranging from 0 to 100 representing how popular the current track is.
spotify get id                                               Gets the current track's ID.
spotify get name                                             Gets the name of the current track.
spotify get artwork-url                                      Gets the URL for the current track's album art.
spotify get url                                              Gets the URL of the current track.
spotify get uri                                              Gets the URI of the current track.
spotify get shuffle                                          Prints whether shuffle is enabled.
spotify get repeat                                           Prints whether repeat is enabled.
spotify get position                                         Gets the current position in the current track (in seconds).
spotify get state                                            Gets the state that Spotify is in, one of: paused, stopped, or playing.

spotify skip                                                 Skips to the next track.
spotify prev                                                 Plays the previous track.
spotify replay                                               Replays the current track from the beginning.
spotify quit                                                 Quits Spotify.
spotify pause                                                Pauses playback of the current track.
```

> NOTE: `[]` represents that an argument/flag is optional, while `<>` represents that an argument/flag is required.
