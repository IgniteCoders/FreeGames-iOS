//
//  ViewController.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var gameList: [Game] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        Task {
            // Llamada en un hilo secundario o tarea asyncrona
            gameList = await FreeToGameApi.getGamesList()
            
            DispatchQueue.main.async {
                // Ya puedo tocar la vista aqui
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        let game = gameList[indexPath.row]
        cell.configure(with: game)
        return cell
    }
}

