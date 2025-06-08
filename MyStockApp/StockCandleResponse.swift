//
//  StockCandleResponse.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import Foundation

struct CandleResponse: Decodable {
    let c: [Double] 
    let t: [Int]
    let s: String
}
