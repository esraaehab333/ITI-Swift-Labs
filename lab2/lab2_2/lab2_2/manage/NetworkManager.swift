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
    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ProductResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(result.products)
                    }
                    
                } catch {
                    print("Decode error:", error)
                }
            }
        }.resume()
    }
}
