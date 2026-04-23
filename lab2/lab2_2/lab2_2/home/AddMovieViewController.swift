//
//  AddMovieViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var movieType: UITextField!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieRate: UITextField!
    @IBOutlet weak var moviePosterURL: UITextField!
    
    var delegate: AddMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Movie"
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        guard
            let name = movieName.text, !name.isEmpty,
            let year = movieYear.text, !year.isEmpty,
            let rating = movieRate.text, !rating.isEmpty,
            let genre = movieType.text, !genre.isEmpty,
            let poster = moviePosterURL.text, !poster.isEmpty
        else {
            let dialog = UIAlertController(
                title: "Error",
                message: "Please fill all fields",
                preferredStyle: .alert
            )
            dialog.addAction(UIAlertAction(title: "OK", style: .default))
            present(dialog, animated: true)
            return
        }
        
        let newMovie = Movie(
            id: UUID().uuidString,
            title: name,
            year: year,
            genre: genre,
            imdbRating: rating,
            poster: poster
        )
        
        delegate?.addMovie(movie: newMovie)
        navigationController?.popViewController(animated: true)
    }
}
