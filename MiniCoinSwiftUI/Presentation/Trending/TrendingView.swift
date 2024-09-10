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
    
    enum Section: String, CaseIterable {
        case favorite = "My Favorite"
        case coin = "Top15 Coin"
        case nft = "Top7 NFT"
    }
    
    //MARK: - Body
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical) {
                LazyVStack {
                    
                    Text(Section.favorite.rawValue)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Section.allCases, id: \.self) { item in
                                favoriteRowView()
                            }
                        }
                    }
                    
                    
                    Text(Section.coin.rawValue)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Section.allCases, id: \.self) { item in
                                
                            }
                        }
                    }
                    
                    Text(Section.nft.rawValue)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(Section.allCases, id: \.self) { item in
                                favoriteRowView()
                            }
                        }
                    }
                    
                    
                }
            }
            
            
            
            
            .navigationTitle("Crypto Coin")
        }
    }
    
    //MARK: - Init
    
    init() {
        self.coinList = dummy
    }
    
    //MARK: - Methods
    
    private func favoriteRowView() -> some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundStyle(.gray.opacity(0.2))
                .frame(width: 300)
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading) {
                        HStack() {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .padding()
                                .frame(width: 50, height: 50)
                                .background(.red)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("coinname")
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("subname")
                                    .font(.callout)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        Spacer()
                        Text("₩123")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 1)
                        
                        Text("+0.54%")
                            .foregroundStyle(.red)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    TrendingView()
}
