//
//  Song.swift
//  beatin WatchKit Extension
//
//  Created by Vítor Bárrios Luís de Albuquerque on 31/05/21.
//

import Foundation

struct Song {
    var id: String
    var name: String
    var artistName: String
    var artworkURL: String
 
    init(id: String, name: String, artistName: String, artworkURL: String) {
        self.id = id
        self.name = name
        self.artworkURL = artworkURL
        self.artistName = artistName
    }
}
