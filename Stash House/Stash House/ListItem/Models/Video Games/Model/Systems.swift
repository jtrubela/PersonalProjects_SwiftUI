//
//  VideoGameConsoles.swift
//  Stash House
//
//  Created by Justin Trubela on 7/19/23.
//

import Foundation

/*
 "name": "N64",
 "manufacturer": "Nintendo",
 "releaseYear": 1996,
 "games": [
    {
    "name": "Cyber Tiger",
    "console": "N64",
    "releaseYear": 1999
    },
 */

struct Console: Hashable, Codable {
    var name: String
    var manufacturer: String
    var releaseYear: Int
    var games: [Game]
    
    var formattedReleaseYear: String {
        return "\(releaseYear)"
    }
}

struct Game: Hashable, Codable {
    var name: String
    var console: String
    var releaseYear: Int
    
    var formattedReleaseYear: String {
        return "\(releaseYear)"
    }
}

