//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , AddMovieDelegate{
    var products: [Product] = []
    @IBOutlet weak var tableView: UITableView!
    func addMovie(movie: Movie) {
        //SQLiteManager.shared.insertMovie(movie: movie)
        //movies = SQLiteManager.shared.fetchMovies()
        //tableView.reloadData()
    }
    @IBAction func addMovieButtonTapped(_ sender: UIButton) {
        //if let addVC = storyboard?.instantiateViewController(identifier: "addMovieVC") as? AddMovieViewController {
              // addVC.delegate = self
           //    navigationController?.pushViewController(addVC, animated: true)
         //  }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
       // movies = SQLiteManager.shared.fetchMovies()
        fetchData()
    }
    func fetchData() {
            NetworkManager.shared.fetchProducts {
                products in
                self.products = products
                self.tableView.reloadData()
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let detailsVC = storyboard?.instantiateViewController(identifier: "detailsVC") as? DetailsViewController {
            //let selectedMovie = movies[indexPath.row]
            detailsVC.product = products[indexPath.row]
           // detailsVC.movie = selectedMovie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        //let movie = movies[indexPath.row]
        let products = products[indexPath.row]
        cell.movieTitle?.text = products.title
        //cell.movieImage.sd_setImage(with: URL(string: product.thumbnail))
        return cell
    }
}
