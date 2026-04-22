//
//  DetailsViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit
class DetailsViewController: UIViewController {
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    //var movie: Movie?
    var product: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
       /* if let movie = movie {
            movieTitle.text = movie.title
            movieYear.text = "\(movie.relaseYear)"
            movieRate.text = "\(movie.rating)"
            movieImage.image = movie.image
            movieType.text = movie.genre.joined(separator: ", ")
        }*/
        if let product = product {
            movieTitle.text = product.title
            movieYear.text = product.description
            movieRate.text = "\(product.price)$"
            loadImage(urlString: product.thumbnail)
        }
    }
    func loadImage(urlString: String) {
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self.movieImage.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
}
