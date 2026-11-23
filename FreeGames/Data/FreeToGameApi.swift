//
//  FreeToGameApi.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

import Foundation

class FreeToGameApi {
    
    static let BASE_URL = "https://www.freetogame.com/api"
    
    static func getGamesList() async -> [Game] {
        guard let url = URL(string: "\(FreeToGameApi.BASE_URL)/games") else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            /*if let str = String(data: data, encoding: .utf8) {
                print("Successfully decoded: \(str)")
            }*/
            
            return try JSONDecoder().decode([Game].self, from: data)
        } catch {
            print("Invalid data")
            return []
        }
    }
    
    static func getGameById(id: Int) async -> Game? {
        guard var url = URL(string: "\(FreeToGameApi.BASE_URL)/game?id=\(id)") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            /*if let str = String(data: data, encoding: .utf8) {
                print("Successfully decoded: \(str)")
            }*/
            
            return try JSONDecoder().decode(Game.self, from: data)
        } catch {
            print("Invalid data")
            return nil
        }
    }
    
}
