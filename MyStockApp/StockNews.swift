//
//  StockNews.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import Foundation

struct StockNews: Decodable, Identifiable {
    var id: String { url }

    let datetime: TimeInterval
    let headline: String
    let source: String
    let url: String
    let image: String? 
}
