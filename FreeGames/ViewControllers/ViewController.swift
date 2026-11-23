//
//  ViewController.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController {
    
    var gameList: [Game] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            // Llamada en un hilo secundario o tarea asyncrona
            gameList = await FreeToGameApi.getGamesList()
            
            DispatchQueue.main.async {
                // Ya puedo tocar la vista aqui
                print(self.gameList)
            }
        }
    }


}

