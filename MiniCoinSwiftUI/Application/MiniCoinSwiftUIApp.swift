//
//  MiniCoinSwiftUIApp.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/9/24.
//

import SwiftUI

@main
struct MiniCoinSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

#Preview(body: {
    MainTabView()
})
