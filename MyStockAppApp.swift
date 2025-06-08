//
//  MyStockAppApp.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

@main
struct MyStockAppApp: App {
    @StateObject private var viewModel = StockViewModel()

    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: viewModel)

        }
    }
}
