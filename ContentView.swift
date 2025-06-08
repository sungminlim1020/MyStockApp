//
//  ContentView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: StockViewModel
    @State private var searchText: String = ""
    @State private var activeSheet: SheetType? = nil 
    
    var filteredStocks: [Stock] {
        if searchText.isEmpty {
            return viewModel.stocks
        } else {
            return viewModel.stocks.filter {
                $0.symbol.lowercased().contains(searchText.lowercased()) ||
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("종목명을 입력하세요", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding([.horizontal, .top])
                
                List {
                    ForEach(filteredStocks) { stock in
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("[\(stock.symbol)] \(stock.name)")
                                        .font(.headline)
                                    Text("가격: \(stock.price)")
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Button {
                                    viewModel.toggleFavorite(for: stock.symbol)
                                } label: {
                                    Image(systemName: stock.isFavorite ? "star.fill" : "star")
                                        .foregroundColor(.yellow)
                                }
                                .buttonStyle(.plain)
                            }
                            
                            HStack {
                                Button("📈 차트 보기") {
                                    activeSheet = .chart(stock.symbol)
                                }
                                .font(.caption)
                                .foregroundColor(.blue)
                                
                                Spacer().frame(width: 16)
                                
                                Button("📰 뉴스 보기") {
                                    activeSheet = .news(stock.symbol)
                                }
                                .font(.caption)
                                .foregroundColor(.blue)
                            }
                        }
                        .padding(.vertical, 8)
                        .onAppear {
                            fetchPrice(for: stock.symbol)
                        }
                    }
                }
            }
            .navigationTitle("📈 주식 검색")
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .chart(let symbol):
                StockChartView(symbol: symbol)
            case .news(let symbol):
                StockNewsView(symbol: symbol)
            }
        }
    }
    
    func fetchPrice(for symbol: String) {
        StockService.shared.fetchPrice(for: symbol) { price in
            if let price = price {
                DispatchQueue.main.async {
                    let displayPrice = price.hasPrefix("$") ? price : "$" + price
                    viewModel.updatePrice(for: symbol, price: displayPrice)
                }
            }
        }
    }
}
