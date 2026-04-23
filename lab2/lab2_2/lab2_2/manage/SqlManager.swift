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
            id TEXT PRIMARY KEY,
            title TEXT,
            year TEXT,
            genre TEXT,
            imdbRating TEXT,
            poster TEXT
        );
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_step(statement)
        }
        sqlite3_finalize(statement)
    }
    
    func insertMovie(movie: Movie) {
        let query = """
        INSERT OR REPLACE INTO movies
        (id, title, year, genre, imdbRating, poster)
        VALUES (?, ?, ?, ?, ?, ?)
        """
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (movie.id as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (movie.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (movie.year as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (movie.genre as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 5, (movie.imdbRating as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 6, (movie.poster as NSString).utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Inserted/Updated")
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
                let id = String(cString: sqlite3_column_text(statement, 0))
                let title = String(cString: sqlite3_column_text(statement, 1))
                let year = String(cString: sqlite3_column_text(statement, 2))
                let genre = String(cString: sqlite3_column_text(statement, 3))
                let imdbRating = String(cString: sqlite3_column_text(statement, 4))
                let poster = String(cString: sqlite3_column_text(statement, 5))
                let movie = Movie(
                    id: id,
                    title: title,
                    year: year,
                    genre: genre,
                    imdbRating: imdbRating,
                    poster: poster
                )
                movies.append(movie)
            }
        }
        sqlite3_finalize(statement)
        return movies
    }
}
