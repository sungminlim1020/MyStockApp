//
//  StockViewModel.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import Foundation

class StockViewModel: ObservableObject {
    @Published var stocks: [Stock] = []

    private let favoritesKey = "favoriteStocks"

    init() {
        loadStocks()
    }

    func loadStocks() {
       
        self.stocks = [
                    Stock(symbol: "AAPL", name: "Apple Inc."),
                    Stock(symbol: "MSFT", name: "Microsoft Corp."),
                    Stock(symbol: "GOOGL", name: "Alphabet Inc."),
                    Stock(symbol: "AMZN", name: "Amazon.com Inc."),
                    Stock(symbol: "META", name: "Meta Platforms Inc."),
                    Stock(symbol: "TSLA", name: "Tesla Inc."),
                    Stock(symbol: "BRK.B", name: "Berkshire Hathaway"),
                    Stock(symbol: "NVDA", name: "NVIDIA Corp."),
                    Stock(symbol: "JPM", name: "JPMorgan Chase"),
                    Stock(symbol: "V", name: "Visa Inc."),
                    Stock(symbol: "UNH", name: "UnitedHealth Group"),
                    Stock(symbol: "HD", name: "Home Depot"),
                    Stock(symbol: "MA", name: "Mastercard Inc."),
                    Stock(symbol: "XOM", name: "ExxonMobil"),
                    Stock(symbol: "PG", name: "Procter & Gamble"),
                    Stock(symbol: "LLY", name: "Eli Lilly & Co."),
                    Stock(symbol: "KO", name: "Coca-Cola Company"),
                    Stock(symbol: "PEP", name: "PepsiCo Inc."),
                    Stock(symbol: "BAC", name: "Bank of America"),
                    Stock(symbol: "MRK", name: "Merck & Co."),
                    Stock(symbol: "AVGO", name: "Broadcom Inc."),
                    Stock(symbol: "ABBV", name: "AbbVie Inc."),
                    Stock(symbol: "WMT", name: "Walmart Inc."),
                    Stock(symbol: "CVX", name: "Chevron Corp."),
                    Stock(symbol: "MCD", name: "McDonald's"),
                    Stock(symbol: "CSCO", name: "Cisco Systems"),
                    Stock(symbol: "ACN", name: "Accenture"),
                    Stock(symbol: "ORCL", name: "Oracle Corp."),
                    Stock(symbol: "ADBE", name: "Adobe Inc."),
                    Stock(symbol: "INTC", name: "Intel Corp."),
                    Stock(symbol: "TMO", name: "Thermo Fisher Scientific"),
                    Stock(symbol: "NKE", name: "Nike Inc."),
                    Stock(symbol: "COST", name: "Costco Wholesale"),
                    Stock(symbol: "TXN", name: "Texas Instruments"),
                    Stock(symbol: "UPS", name: "United Parcel Service"),
                    Stock(symbol: "NEE", name: "NextEra Energy"),
                    Stock(symbol: "PM", name: "Philip Morris Intl"),
                    Stock(symbol: "MS", name: "Morgan Stanley"),
                    Stock(symbol: "UNP", name: "Union Pacific"),
                    Stock(symbol: "DHR", name: "Danaher Corp."),
                    Stock(symbol: "TMUS", name: "T-Mobile US"),
                    Stock(symbol: "AMD", name: "Advanced Micro Devices"),
                    Stock(symbol: "LIN", name: "Linde plc"),
                    Stock(symbol: "QCOM", name: "Qualcomm"),
                    Stock(symbol: "BMY", name: "Bristol-Myers Squibb"),
                    Stock(symbol: "SCHW", name: "Charles Schwab"),
                    Stock(symbol: "GS", name: "Goldman Sachs"),
                    Stock(symbol: "NOW", name: "ServiceNow"),
                    Stock(symbol: "SPGI", name: "S&P Global"),
                    Stock(symbol: "ISRG", name: "Intuitive Surgical"),
                    Stock(symbol: "PLD", name: "Prologis Inc."),
                    Stock(symbol: "T", name: "AT&T Inc."),
                    Stock(symbol: "AMAT", name: "Applied Materials"),
                    Stock(symbol: "MO", name: "Altria Group"),
                    Stock(symbol: "GE", name: "General Electric"),
                    Stock(symbol: "AMGN", name: "Amgen Inc."),
                    Stock(symbol: "FDX", name: "FedEx Corp."),
                    Stock(symbol: "DE", name: "Deere & Co."),
                    Stock(symbol: "LRCX", name: "Lam Research"),
                    Stock(symbol: "GM", name: "General Motors"),
                    Stock(symbol: "BA", name: "Boeing Co."),
                    Stock(symbol: "ZTS", name: "Zoetis Inc."),
                    Stock(symbol: "MDLZ", name: "Mondelez Intl"),
                    Stock(symbol: "GILD", name: "Gilead Sciences"),
                    Stock(symbol: "EL", name: "Estee Lauder"),
                    Stock(symbol: "VRTX", name: "Vertex Pharmaceuticals"),
                    Stock(symbol: "ADI", name: "Analog Devices"),
                    Stock(symbol: "MAR", name: "Marriott Intl"),
                    Stock(symbol: "CL", name: "Colgate-Palmolive"),
                    Stock(symbol: "KHC", name: "Kraft Heinz"),
                    Stock(symbol: "PFE", name: "Pfizer Inc."),
                    Stock(symbol: "CRM", name: "Salesforce"),
                    Stock(symbol: "LMT", name: "Lockheed Martin"),
                    Stock(symbol: "ETN", name: "Eaton Corporation"),
                    Stock(symbol: "AIG", name: "American Intl Group"),
                    Stock(symbol: "CTAS", name: "Cintas Corporation"),
                    Stock(symbol: "SBUX", name: "Starbucks Corp."),
                    Stock(symbol: "DG", name: "Dollar General"),
                    Stock(symbol: "HCA", name: "HCA Healthcare"),
                    Stock(symbol: "MMM", name: "3M Company"),
                    Stock(symbol: "ADP", name: "Automatic Data Processing"),
                    Stock(symbol: "F", name: "Ford Motor Co."),
                    Stock(symbol: "BX", name: "Blackstone Inc."),
                    Stock(symbol: "SO", name: "Southern Company"),
                    Stock(symbol: "EW", name: "Edwards Lifesciences"),
                    Stock(symbol: "C", name: "Citigroup Inc."),
                    Stock(symbol: "MNST", name: "Monster Beverage"),
                    Stock(symbol: "TGT", name: "Target Corporation"),
                    Stock(symbol: "WELL", name: "Welltower Inc."),
                    Stock(symbol: "ROST", name: "Ross Stores Inc."),
                    Stock(symbol: "AEP", name: "American Electric Power"),
                    Stock(symbol: "HPQ", name: "HP Inc."),
                    Stock(symbol: "HAL", name: "Halliburton Co."),
                    Stock(symbol: "BK", name: "Bank of New York Mellon"),
                    Stock(symbol: "IDXX", name: "IDEXX Laboratories"),
                    Stock(symbol: "FTNT", name: "Fortinet Inc."),
                    Stock(symbol: "WBA", name: "Walgreens Boots Alliance")
        ]

        
        loadFavorites()
    }

    func toggleFavorite(for symbol: String) {
        if let index = stocks.firstIndex(where: { $0.symbol == symbol }) {
            stocks[index].isFavorite.toggle()
            saveFavorites()
        }
    }

    func updatePrice(for symbol: String, price: String) {
        if let index = stocks.firstIndex(where: { $0.symbol == symbol }) {
            stocks[index].price = price
        }
    }

   

    private func saveFavorites() {
        let favoriteSymbols = stocks.filter { $0.isFavorite }.map { $0.symbol }
        UserDefaults.standard.set(favoriteSymbols, forKey: favoritesKey)
    }

    private func loadFavorites() {
        let savedSymbols = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        for i in stocks.indices {
            stocks[i].isFavorite = savedSymbols.contains(stocks[i].symbol)
        }
    }
}
