//
//  ListViewController.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var gameList: [Game] = []
    var filteredGameList: [Game] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        
        Task {
            // Llamada en un hilo secundario o tarea asyncrona
            gameList = await FreeToGameApi.getGamesList()
            filteredGameList = gameList
            
            DispatchQueue.main.async {
                // Ya puedo tocar la vista aqui
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game Cell", for: indexPath) as! GameViewCell
        let game = filteredGameList[indexPath.row]
        cell.configure(with: game)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let textToSearch = searchText.uppercased()
        if textToSearch.isEmpty {
            filteredGameList = gameList
        } else {
            filteredGameList = gameList.filter { game in
                game.title.uppercased().contains(textToSearch)
            }
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredGameList = gameList
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let detailViewController = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let game = filteredGameList[indexPath.row]
            detailViewController.game = game
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

