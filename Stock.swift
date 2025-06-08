//
//  Stock.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//
import Foundation

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    var price: String = "-"
    var isFavorite: Bool = false
}

