//
//  MainTabView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel: StockViewModel

    var body: some View {
        TabView {
            ContentView(viewModel: viewModel)
                .tabItem {
                    Label("전체", systemImage: "list.bullet")
                }

            FavoriteView(viewModel: viewModel)
                .tabItem {
                    Label("즐겨찾기", systemImage: "star.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(viewModel: StockViewModel())
    }
}
