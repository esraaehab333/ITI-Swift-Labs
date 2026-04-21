//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddMovieDelegate{
    
    func addMovie(movie: Movie) {
        listOfMovies.append(movie)
        tableView.reloadData()
    }
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        if let addVC = storyboard?.instantiateViewController(identifier: "addMovieVC") as? AddMovieViewController {
               addVC.delegate = self
               navigationController?.pushViewController(addVC, animated: true)
           }
    }
    @IBOutlet weak var tableView: UITableView!
    var listOfMovies: [Movie] = [
        Movie(
            title: "Inception",
            image: UIImage(named: "Inception")!,
            rating: 8.8,
            relaseYear: 2010,
            genre: ["Action", "Sci-Fi", "Thriller"]
        ),
        Movie(
            title: "The Dark Knight",
            image: UIImage(named: "The Dark Knight")!,
            rating: 9.0,
            relaseYear: 2008,
            genre: ["Action", "Crime", "Drama"]
        ),
        Movie(
            title: "Interstellar",
            image: UIImage(named: "Interstellar")!,
            rating: 8.6,
            relaseYear: 2014,
            genre: ["Adventure", "Drama", "Sci-Fi"]
        ),
        Movie(
            title: "The Matrix",
            image: UIImage(named: "Matrix")!,
            rating: 8.7,
            relaseYear: 1999,
            genre: ["Action", "Sci-Fi"]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            let selectedMovie = listOfMovies[indexPath.row]
            detailsVC.title = selectedMovie.title
            detailsVC.movie = selectedMovie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let movie = listOfMovies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieImage.image = movie.image
        return cell
    }
}
