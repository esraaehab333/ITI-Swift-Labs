//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit

class ViewController: UITableViewController {
    var listOfMovies: [Movie] = [
        Movie(
            title: "Inception",
            image: "https://www.impawards.com/2010/posters/inception_ver3_xlg.jpg",
            rating: 8.8,
            relaseYear: 2010,
            genre: ["Action", "Sci-Fi", "Thriller"]
        ),
        Movie(
            title: "The Dark Knight",
            image: "https://www.impawards.com/2008/posters/dark_knight_ver5_xlg.jpg",
            rating: 9.0,
            relaseYear: 2008,
            genre: ["Action", "Crime", "Drama"]
        ),
        Movie(
            title: "Interstellar",
            image: "https://www.impawards.com/2014/posters/interstellar_ver3_xlg.jpg",
            rating: 8.6,
            relaseYear: 2014,
            genre: ["Adventure", "Drama", "Sci-Fi"]
        ),
        Movie(
            title: "The Matrix",
            image: "https://www.impawards.com/1999/posters/matrix_ver1_xlg.jpg",
            rating: 8.7,
            relaseYear: 1999,
            genre: ["Action", "Sci-Fi"]
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            let selectedMovie = listOfMovies[indexPath.row]
            detailsVC.title = selectedMovie.title
            detailsVC.movie = selectedMovie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfMovies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listOfMovies[indexPath.row].title
        return cell
    }
}

