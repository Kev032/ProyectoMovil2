//
//  Noticia.swift
//  ProyectoDAM2
//
//  Created by Josset Gutierrez Huaman on 19/10/23.
//

import UIKit

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Noticia]
}

struct Noticia: Codable {
    let source: Source!
    let author: String!
    let title: String!
    let description: String!
    let url: String!
    let urlToImage: String!
    let publishedAt: String!
    let content: String!
}

struct Source: Codable {
    let id: String!
    let name: String!
}
