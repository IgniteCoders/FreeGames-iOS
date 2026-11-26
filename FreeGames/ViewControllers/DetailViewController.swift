//
//  DetailViewController.swift
//  FreeGames
//
//  Created by Turno Mananas on 26/11/2026.
//

import UIKit

class DetailViewController: UIViewController {
    
    var game: Game!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = game.title
        
        Task {
            // Llamada en un hilo secundario o tarea asyncrona
            game = await FreeToGameApi.getGameById(id: game.id)
            
            DispatchQueue.main.async {
                // Ya puedo tocar la vista aqui
                self.loadData()
            }
        }
    }
    
    func loadData() {
        
        
        
    }
}
