import UIKit

class Movie: Codable {
    let id: String
    let title: String
    let year: String
    let genre: String
    let imdbRating: String
    let poster: String
    init(id: String, title: String, year: String, genre: String, imdbRating: String, poster: String) {
        self.id = id
        self.title = title
        self.year = year
        self.genre = genre
        self.imdbRating = imdbRating
        self.poster = poster
    }
}
