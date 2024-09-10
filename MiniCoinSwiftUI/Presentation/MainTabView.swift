//
//  MainTabView.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import SwiftUI

struct MainTabView: View {
    
    //MARK: - Body
    
    var body: some View {
        TabView {
            TrendingView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("차트")
                }
            
            TrendingView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("차트")
                }
            
                
        }
        .tint(.purple)
        
    }
    
    //MARK: - Init
    
    init() {
//        setupTabBarAppearance()
    }
    
    //MARK: - Methods
    
    //틴트 컬러 변경하기(더이상 사용 X)
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.stackedLayoutAppearance.selected.iconColor = .systemPurple
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemPurple]
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        // 적용
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    MainTabView()
}
