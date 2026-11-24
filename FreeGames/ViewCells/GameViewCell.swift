//
//  GameViewCell.swift
//  FreeGames
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class GameViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImage: UIImageView!
    @IBOutlet weak var genreView: UIView!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        
        cardView
            .roundCorners(radius: 24)
            .setBorder(width: 1, color: .lightGray)
        
        cardShadowView
            .roundCorners(radius: 24)
            .setShadow()
        
        genreView.roundCorners(radius: 8)
        
        /*cardView.layer.cornerRadius = 24
        cardView.layer.masksToBounds = true
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.lightGray.cgColor*/
        
        /*cardShadowView.layer.cornerRadius = 24
        cardShadowView.layer.shadowRadius = 4
        cardShadowView.layer.shadowOffset = CGSize(width: 4, height: 4)
        cardShadowView.layer.shadowColor = UIColor.lightGray.cgColor
        cardShadowView.layer.shadowOpacity = 0.5*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            cardView.backgroundColor = .systemGray3
        } else {
            cardView.backgroundColor = .systemBackground
        }
    }

    func configure(with game: Game) {
        titleLabel.text = game.title
        descriptionLabel.text = game.shortDescription
        genreLabel.text = game.genre
        if game.platform.contains("Windows") {
            platformImage.image = UIImage(systemName: "desktopcomputer")
        } else {
            platformImage.image = UIImage(systemName: "safari.fill")
        }
        thumbnailImageView.loadFrom(url: game.thumbnail)
    }
}
