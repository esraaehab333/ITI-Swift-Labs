//
//  UIImageExtention.swift
//  lab2_2
//
//  Created by Nemo on 26/04/2026.
//

import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(_ path: String) {
        
        if let image = UIImage(named: path) {
            self.image = image
            return
        }
        
        if let url = URL(string: path), path.starts(with: "http") {
            self.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
            return
        }
        
        let localURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(path)
        
        self.image = UIImage(contentsOfFile: localURL.path)
    }
}
