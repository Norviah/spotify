//
//  Get.swift
//  spotify
//
//  Created by Norviah on 8/13/20.
//  Copyright © 2020 Norviah. All rights reserved.
//

import ArgumentParser

struct Get: ParsableCommand {
  static let configuration: CommandConfiguration = CommandConfiguration(
    // Optional abstracts and discussions are used for help output.
    abstract: "Get various aspects of the current track.",

    // Pass an array to `subcommands` to set up a nested tree of subcommands.
    // With language support for type-level introspection, this could be
    // provided by automatically finding nested `ParsableCommand` types.
    subcommands: [
      GetArtist.self,
      GetAlbum.self,
      AlbumArtist.self,
      DiscNumber.self,
      Length.self,
      PlayedCount.self,
      TrackNumber.self,
      Popularity.self,
      ID.self,
      Name.self,
      ArtworkURL.self,
      GetURL.self,
      GetURI.self,
      GetShuffle.self,
      GetRepeat.self,
      Position.self,
      State.self,
    ]
  )
}
