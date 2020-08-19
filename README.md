## spotify

A command line interface used to control Spotify for OS X, `spotify` uses `AppleScript` to set and get values to and from Spotify.

### Installation

```
brew install norviah/formulae/spotify
```

If you have installed the application Spotify via `brew cask`, `brew` may not link `spotify` to your `PATH`, to fix this, you have to link it manually by doing:

```
brew link spotify
```

### API

In order to use most of the subcommands for the command `play`, you'll need to create and register an application with [Spotify's API](https://developer.spotify.com/my-applications/#!/applications/create). Once you have created an application, save the ID and SECRET token and save them into the config file: `$HOME/.spotify`.

The config file must be `JSON` with the format being:
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
spotify play                                                Resumes playback of the current track.
spotify play album   <name> [--limit <1-50>] (default: 1)   Finds and plays the given album. [*]
spotify play track   <name> [--limit <1-50>] (default: 1)   Finds and plays the given track. [*]
spotify play list    <name> [--limit <1-50>] (default: 10)  Finds and plays the given playlist. [*]
spotify play artist  <name> [--limit <1-50>] (default: 1)   Finds and plays the given artist. [*]
spotify play uri     <uri>                                  Plays the given URI.

spotify vol                                                 Display's the current volume.
spotify vol up                                              Increases the volume by 10%.
spotify vol down                                            Decreases the volume by 10%.
spotify vol set <0-100>                                     Sets the volume to the given amount [0-100].

spotify toggle playback  [bool]                             Toggle or set playback of the current track.
spotify toggle shuffle   [bool]                             Toggle or set shuffle.
spotify toggle repeat    [bool]                             Toggle or set repeat.

spotify jump to        <position>                           Jumps to the given time (in seconds) in the current track.
spotify jump forward   [amount] (default: 15)               Jumps ahead (in seconds) in the current track.
spotify jump backward  [amount] (default: 15)               Jumps behind (in seconds) in the current track.

spotify get artist                                          Displays the artist of the current track.
spotify get album                                           Displays the name of the album the current track is from.
spotify get album-artist                                    Displays the artist of the album the current track is from.
spotify get disc-number                                     Displays the disc number of the current track.
spotify get length                                          Displays the length of the current track (in seconds).
spotify get played-count                                    Displays the amount of times the current track has been played.
spotify get track-number                                    Displays the index of the current track from it's album.
spotify get popularity                                      Displays a value ranging from 0 to 100 representing how popular the current track is.
spotify get id                                              Displays the current track's ID.
spotify get name                                            Displays the name of the current track.
spotify get artwork-url                                     Displays the URL for the current track's album art.
spotify get url                                             Displays the URL of the current track.
spotify get uri                                             Displays the URI of the current track.
spotify get shuffle                                         Displays whether shuffle is enabled.
spotify get repeat                                          Displays whether repeat is enabled.
spotify get position                                        Displays your position in the current track (in seconds).
spotify get state                                           Displays the state that Spotify is in, one of: paused, stopped, or playing.

spotify skip                                                Skips the current track.
spotify prev                                                Replays the previous track.
spotify replay                                              Replays the current track.
spotify quit                                                Quits Spotify.
spotify pause                                               Pauses the current track.
spotify lyrics                                              Finds and displays lyrics for the current track.
```

> note: `[]` represents that an argument/flag is optional, while `<>` represents that an argument/flag is required.
