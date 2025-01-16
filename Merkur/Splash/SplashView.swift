//
//  SplashView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 15.01.2025.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var vm = SplashViewModel()
    var body: some View {

        MainView()
            .fullScreenCover(isPresented: $vm.sheet) {
                PrivacyView(url: URL(string: vm.url!)!)
                    .ignoresSafeArea()
            }
        
    }
}

#Preview {
    SplashView()
}


