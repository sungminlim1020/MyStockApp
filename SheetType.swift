//
//  SheetType.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

enum SheetType: Identifiable {
    case chart(String)
    case news(String)

    var id: String {
        switch self {
        case .chart(let symbol): return "chart-\(symbol)"
        case .news(let symbol): return "news-\(symbol)"
        }
    }
}

