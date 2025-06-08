//
//  StockChartView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI
import Charts

struct ChartData: Identifiable {
    let id = UUID()
    let date: Date
    let close: Double
}

struct StockChartView: View {
    let symbol: String
    @State private var prices: [ChartData] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("📈 \(symbol) 최근 30일 주가")
                    .font(.title2)
                    .bold()

                if prices.isEmpty {
                    ProgressView("로딩 중...")
                        .padding(.top, 40)
                } else {
                    Chart {
                        ForEach(prices) { data in
                            LineMark(
                                x: .value("날짜", data.date),
                                y: .value("가격", data.close)
                            )
                        }
                    }
                    .frame(height: 300)
                }
            }
            .padding()
        }
        .navigationTitle("\(symbol) 차트") // ✅ 뒤로가기 버튼 자동 생성
        .onAppear {
            fetchCandleData()
        }
    }

    func fetchCandleData() {
        let to = Int(Date().timeIntervalSince1970)
        let from = to - 60 * 60 * 24 * 30 // 최근 30일

        let apiKey = "d0uhv3hr01qn5fk5gr20d0uhv3hr01qn5fk5gr2g"
        let urlString = "https://finnhub.io/api/v1/stock/candle?symbol=\(symbol)&resolution=D&from=\(from)&to=\(to)&token=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                print("✅ 응답: \(String(data: data, encoding: .utf8) ?? "nil")")

                if let decoded = try? JSONDecoder().decode(CandleResponse.self, from: data),
                   decoded.s == "ok" {
                    let newData = zip(decoded.t, decoded.c).map { ts, price in
                        ChartData(date: Date(timeIntervalSince1970: TimeInterval(ts)), close: price)
                    }
                    DispatchQueue.main.async {
                        self.prices = newData
                    }
                } else {
                    print("❌ 디코딩 실패 or s != ok")
                }
            } else {
                print("❌ 요청 실패")
            }
        }.resume()
    }
}

