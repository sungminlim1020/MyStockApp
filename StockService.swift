//
//  StockService.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import Foundation

struct FinnhubQuoteResponse: Decodable {
    let c: Double  
}

class StockService {
    static let shared = StockService()
    private let apiKey = "d0uhv3hr01qn5fk5gr20d0uhv3hr01qn5fk5gr2g"

    func fetchPrice(for symbol: String, completion: @escaping (String?) -> Void) {
        let urlString = "https://finnhub.io/api/v1/quote?symbol=\(symbol)&token=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(FinnhubQuoteResponse.self, from: data) {
                    let price = String(format: "%.2f", decoded.c)
                    completion("$\(price)")
                    return
                } else {
                    print("디코딩 실패: \(String(data: data, encoding: .utf8) ?? "nil")")
                }
            } else {
                print("네트워크 오류: \(error?.localizedDescription ?? "알 수 없음")")
            }
            completion(nil)
        }.resume()
    }
}
