//
//  DetailViewController.swift
//  FreeGames
//
//  Created by Turno Mananas on 26/11/2026.
//

import UIKit

class DetailViewController: UIViewController {
    
    var game: Game!

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var systemRequirementsOsLabel: UILabel!
    @IBOutlet weak var systemRequirementsProcessorLabel: UILabel!
    @IBOutlet weak var systemRequirementsMemoryLabel: UILabel!
    @IBOutlet weak var systemRequirementsGraphicsLabel: UILabel!
    @IBOutlet weak var systemRequirementsStorageLabel: UILabel!
    
    @IBOutlet var cardViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for card in cardViews {
            card.roundCorners(radius: 16)
        }
        
        
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
        thumbnailImageView.loadFrom(url: game.thumbnail)
        titleLabel.text = game.title
        developerLabel.text = game.developer
        publisherLabel.text = game.publisher
        descriptionLabel.text = game.description
        
        systemRequirementsOsLabel.text = game.systemRequirements?.os
        systemRequirementsProcessorLabel.text = game.systemRequirements?.processor
        systemRequirementsMemoryLabel.text = game.systemRequirements?.memory
        systemRequirementsGraphicsLabel.text = game.systemRequirements?.graphics
        systemRequirementsStorageLabel.text = game.systemRequirements?.storage
    }
    
    @IBAction func showMoreClicked(_ sender: UIButton) {
        if descriptionLabel.numberOfLines == 0 {
            descriptionLabel.numberOfLines = 5
            sender.setTitle("Show more", for: .normal)
            UIView.animate(withDuration: 0.5) {
                sender.imageView!.transform = CGAffineTransform(rotationAngle: 0)
            }
        } else {
            descriptionLabel.numberOfLines = 0
            sender.setTitle("Show less", for: .normal)
            UIView.animate(withDuration: 0.5) {
                sender.imageView!.transform = CGAffineTransform(rotationAngle: .pi)
            }
        }
    }
}
