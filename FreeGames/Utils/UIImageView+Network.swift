//
//  UIImageViewExtensions.swift
//  FreeGames-iOS
//
//  Created by Mananas on 12/11/25.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func loadFrom(url: String) {
        if let url = URL(string: url) {
            self.loadFrom(url: url)
        }
    }
}
