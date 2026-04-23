//
//  NetworkManager.swift
//  lab2_2
//
//  Created by Nemo on 22/04/2026.
//

import UIKit
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchMovies(completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://fooapi.com/api/movies") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error:", error)
                return
            }
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(result.data)
                }
            } catch {
                print("Decode error:", error)
            }
        }.resume()
    }
}
