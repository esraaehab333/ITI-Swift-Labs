//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//
import UIKit
import Network
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddMovieDelegate{
    
    var movies: [Movie] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        fetchData()
    }
    func fetchData() {
        if NetworkChecker.shared.isConnected{
            NetworkManager.shared.fetchMovies { [weak self] movies in
                guard let self = self else { return }
                CoreDataManager.shared.saveMovies(movies)
                DispatchQueue.main.async {
                    self.movies = CoreDataManager.shared.fetchMovies()
                    self.tableView.reloadData()
                }
            }
        } else {
            movies = CoreDataManager.shared.fetchMovies()
            tableView.reloadData()
            showOfflineAlert()
        }
    }
    func showOfflineAlert() {
        let alert = UIAlertController(
            title: "No Connection",
            message: "You are currently viewing pre-loaded offline data.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func addMovieButtonTapped(_ sender: UIBarButtonItem) {
        if let addVC = storyboard?.instantiateViewController(identifier: "addMovieVC") as? AddMovieViewController {
               addVC.delegate = self
               navigationController?.pushViewController(addVC, animated: true)
           }
    }
        
    func addMovie(movie: Movie) {
        CoreDataManager.shared.saveMovies([movie])
        movies = CoreDataManager.shared.fetchMovies()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            let selectedMovie = movies[indexPath.row]
            detailsVC.movie = selectedMovie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let movie = movies[indexPath.row]
        cell.movieTitle.text = movie.title
        cell.movieImage.loadImage(movie.poster)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let movieToDelete = movies[indexPath.row]
            CoreDataManager.shared.deleteMovie(id: movieToDelete.id)
            movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
