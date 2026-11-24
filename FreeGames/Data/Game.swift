//
//  Game.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let genre: String
    let platform: String
    let shortDescription: String
    let profileUrl: String
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case profileUrl = "freetogame_profile_url"
        case id, title, thumbnail, genre, platform
    }
}
