//
//  StockNewsView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

struct StockNewsView: View {
    let symbol: String
    @State private var articles: [StockNews] = []
    @State private var isLoaded = false

    var body: some View {
        List(articles) { article in
            HStack(alignment: .top, spacing: 12) {
                AsyncImage(url: URL(string: article.image ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 60)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            .clipped()
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray.opacity(0.5))
                    @unknown default:
                        EmptyView()
                    }
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(article.headline)
                        .font(.headline)
                        .lineLimit(2)

                    Text("출처: \(article.source)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("날짜: \(formattedDate(from: article.datetime))")
                        .font(.caption)

                    if let url = URL(string: article.url) {
                        Link("🔗 기사 보기", destination: url)
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical, 6)
        }
        .navigationTitle("📰 \(symbol) 뉴스")
        .onAppear {
            if !isLoaded {
                fetchNews()
                isLoaded = true
            }
        }
    }

    func formattedDate(from timestamp: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    func fetchNews() {
        let to = Date()
        let from = Calendar.current.date(byAdding: .day, value: -30, to: to)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromString = formatter.string(from: from)
        let toString = formatter.string(from: to)

        let apiKey = "d0uhv3hr01qn5fk5gr20d0uhv3hr01qn5fk5gr2g"
        let urlString = "https://finnhub.io/api/v1/company-news?symbol=\(symbol)&from=\(fromString)&to=\(toString)&token=\(apiKey)"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([StockNews].self, from: data) {
                    DispatchQueue.main.async {
                        self.articles = decoded
                    }
                } else {
                    print("❌ 뉴스 디코딩 실패")
                }
            } else {
                print("❌ 뉴스 요청 실패")
            }
        }.resume()
    }
}

