//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddMovieDelegate{
    
    func addMovie(movie: Movie) {
        MovieManager.shared.movies.append(movie)
        tableView.reloadData()
    }
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        if let addVC = storyboard?.instantiateViewController(identifier: "addMovieVC") as? AddMovieViewController {
               addVC.delegate = self
               navigationController?.pushViewController(addVC, animated: true)
           }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            let selectedMovie = MovieManager.shared.movies[indexPath.row]
            detailsVC.title = selectedMovie.title
            detailsVC.movie = selectedMovie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MovieManager.shared.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let movie = MovieManager.shared.movies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieImage.image = movie.image
        return cell
    }
}
