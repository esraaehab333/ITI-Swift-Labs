//
//  CoreDataManager.swift
//  lab2_2
//
//  Created by Nemo on 23/04/2026.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    
    func saveMovies(_ movies: [Movie]) {
        for movie in movies {
            let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", movie.id)
            
            let exists = (try? context.count(for: fetchRequest)) ?? 0
            if exists == 0 {
                let entity = MovieEntity(context: context)
                entity.id = movie.id
                entity.title = movie.title
                entity.year = movie.year
                entity.genre = movie.genre
                entity.imdbRating = movie.imdbRating
                entity.poster = movie.poster
            }
        }
        saveContext()
    }
    
    func fetchMovies() -> [Movie] {
        do {
            let result = try context.fetch(MovieEntity.fetchRequest()) as! [MovieEntity]
            return result.map {
                Movie(
                    id: $0.id ?? "",
                    title: $0.title ?? "",
                    year: $0.year ?? "",
                    genre: $0.genre ?? "",
                    imdbRating: $0.imdbRating ?? "",
                    poster: $0.poster ?? ""
                )
            }
        } catch {
            print("Fetch error:", error)
            return []
        }
    }
    
    func deleteMovie(id: String) {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        if let result = try? context.fetch(fetchRequest), let entity = result.first {
            context.delete(entity)
            saveContext()
        }
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Save error:", error)
        }
    }
}
