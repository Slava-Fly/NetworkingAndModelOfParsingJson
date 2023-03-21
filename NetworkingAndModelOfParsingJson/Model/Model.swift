//
//  Model.swift
//  NetworkingAndModelOfParsingJson
//
//  Created by User on 20.03.2023.
//

import Foundation

struct RickAndMorty: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: URL?
    
}
