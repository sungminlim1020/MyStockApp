//
//  FavoriteView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: StockViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.stocks.filter { $0.isFavorite }) { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("[\(stock.symbol)] \(stock.name)")
                            Text("가격: \(stock.price)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .navigationTitle("⭐️ 즐겨찾기")
        }
    }
}
