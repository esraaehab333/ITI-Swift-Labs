//
//  ViewController.swift
//  testSDWebImage
//
//  Created by Nemo on 17/04/2026.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://yavuzceliker.github.io/sample-images/image-5.jpg") {
            imageView.sd_setImage(with: url)
        }
    }
}

