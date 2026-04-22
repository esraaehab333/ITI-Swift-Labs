//
//  SqlManager.swift
//  lab2_2
//
//  Created by Nemo on 22/04/2026.
//

import UIKit
import SQLite3

class SQLiteManager {
    
    static let shared = SQLiteManager()
    var db: OpaquePointer?
    
    private init() {
        openDatabase()
        createTable()
    }
    
    func openDatabase() {
        let fileURL = try! FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("movies.sqlite")
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            print("DB Opened")
        } else {
            print("DB Error")
        }
    }
    
    func createTable() {
        let query = """
        CREATE TABLE IF NOT EXISTS movies (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            rating REAL,
            year INTEGER,
            genre TEXT,
            image BLOB
        );
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_step(statement)
        }
        sqlite3_finalize(statement)
    }
    
    func insertMovie(movie: Movie) {
        let query = "INSERT INTO movies (title, rating, year, genre, image) VALUES (?, ?, ?, ?, ?)"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (movie.title as NSString).utf8String, -1, nil)
            sqlite3_bind_double(statement, 2, Double(movie.rating))
            sqlite3_bind_int(statement, 3, Int32(movie.relaseYear))
            let genres = movie.genre.joined(separator: ",")
            sqlite3_bind_text(statement, 4, (genres as NSString).utf8String, -1, nil)
            if let imageData = movie.image.jpegData(compressionQuality: 0.8) {
                sqlite3_bind_blob(statement, 5, (imageData as NSData).bytes, Int32(imageData.count), nil)
            }
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Inserted")
            }
        }
        sqlite3_finalize(statement)
    }
    
    func fetchMovies() -> [Movie] {
        var movies: [Movie] = []
        let query = "SELECT * FROM movies"
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let title = String(cString: sqlite3_column_text(statement, 1))
                let rating = Float(sqlite3_column_double(statement, 2))
                let year = Int(sqlite3_column_int(statement, 3))
                let genreText = String(cString: sqlite3_column_text(statement, 4))
                let genres = genreText.components(separatedBy: ",")
                let blob = sqlite3_column_blob(statement, 5)
                let size = sqlite3_column_bytes(statement, 5)
                let data = Data(bytes: blob!, count: Int(size))
                let image = UIImage(data: data) ?? UIImage()
                let movie = Movie(
                    title: title,
                    image: image,
                    rating: rating,
                    relaseYear: year,
                    genre: genres
                )
                movies.append(movie)
            }
        }
        sqlite3_finalize(statement)
        return movies
    }
}
