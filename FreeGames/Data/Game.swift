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
    let developer: String
    let publisher: String
    let shortDescription: String
    let description: String?
    let profileUrl: String
    let systemRequirements: SystemRequirements?
    let screenshots: [Screenshot]?
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case profileUrl = "freetogame_profile_url"
        case systemRequirements = "minimum_system_requirements"
        case id, title, thumbnail, genre, platform, developer, publisher, description, screenshots
    }
}

struct SystemRequirements: Codable{
    let os: String
    let processor: String
    let memory: String
    let graphics: String
    let storage: String
}

struct Screenshot: Codable {
    let image: String
}
