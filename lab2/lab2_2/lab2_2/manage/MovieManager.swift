//
//  MovieManager.swift
//  lab2_2
//
//  Created by Nemo on 21/04/2026.
//
import UIKit

class MovieManager {
    static let shared = MovieManager()
    
    private init() {}
    
    var movies: [Movie] = [
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
}
