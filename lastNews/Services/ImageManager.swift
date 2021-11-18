//
//  ImageManager.swift
//  lastNews
//
//  Created by Максим Хлесткин on 17.11.2021.
//

import Kingfisher
import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    func getImage(url: String, image: UIImageView) {
        guard let imageURL = URL(string: url) else { return }
        image.kf.indicatorType = .activity
        image.kf.setImage(with: imageURL)
    }
}
