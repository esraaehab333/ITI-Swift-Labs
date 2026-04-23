//
//  MovieResponse.swift
//  lab2_2
//
//  Created by Nemo on 23/04/2026.
//

class MovieResponse: Codable {
    let data: [Movie]
    init(data: [Movie]) {
        self.data = data
    }
}
