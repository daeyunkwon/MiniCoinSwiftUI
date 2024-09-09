//
//  TrendingView.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import SwiftUI

struct TrendingView: View {

    //MARK: - Properties
    
    private var coinList: [CoinItem] = []
    
    //MARK: - Body
    
    var body: some View {
        
        Text("test")
        
        .navigationTitle("Crypto Coin")
    }
    
    //MARK: - Init
    
    init() {
        self.coinList = dummy
    }
}

#Preview {
    TrendingView()
}

