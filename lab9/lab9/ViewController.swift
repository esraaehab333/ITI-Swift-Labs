//
//  ViewController.swift
//  lab9
//
//  Created by Nemo on 29/04/2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func saveBtn(_ sender: Any) {
        let url = URL(string: "https://tse2.mm.bing.net/th/id/OIP.FAdDQOzNntGzAL6hRb3JMwHaE7?w=800&h=533&rs=1&pid=ImgDetMain&o=7&rm=3")
        guard let myUrl = url else {
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: myUrl)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {[weak self] in
                        self?.myImage.image = image
                    }
                }
            } catch let error {
                print("Error loading image: \(error.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            for _ in 1...5 {
                print("🍩")
            }
        }
        DispatchQueue.global().sync {
            for _ in 1...5 {
                print("🍩")
            }
        }
        DispatchQueue.global().sync {
            for _ in 1...5 {
                print("🍟")
            }
        }
        DispatchQueue.global().async {
            for _ in 1...5 {
                print("🍟")
            }
        }
    }


}

