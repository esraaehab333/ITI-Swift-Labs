//
//  DetailsViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            movieTitle.text = movie.title
            movieYear.text = movie.year
            movieRate.text = movie.imdbRating
            movieType.text = movie.genre
            movieImage.sd_setImage(
                with: URL(string: movie.poster),
                placeholderImage: UIImage(named: "placeholder")
            )
        }
    }
}
