//
//  LoginView.swift
//  MyStockApp
//
//  Created by 임성민 on 2025/06/02.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: StockViewModel

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            MainTabView(viewModel: viewModel)
        } else {
            VStack(spacing: 20) {
                Text("📲 내 주식 앱")
                    .font(.largeTitle)
                    .bold()

                TextField("이메일", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                SecureField("비밀번호", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("로그인") {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("회원가입") {}
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}
