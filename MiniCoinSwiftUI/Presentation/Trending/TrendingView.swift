//
//  TrendingView.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import SwiftUI

import Kingfisher

struct TrendingView: View {

    //MARK: - Properties
    
    private var coinList: [CoinItem] = []
    private var nftList: [NFTItem] = []
    
    enum Section: String, CaseIterable {
        case favorite = "My Favorite"
        case coin = "Top15 Coin"
        case nft = "Top7 NFT"
    }
    
    //목록을 1부터 1000까지 만듬
    private let data = Array(1...1000).map { "목록 \($0)"}
    
    //화면을 그리드형식으로 꽉채워줌
    private let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
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
                        LazyHGrid(rows: layout, spacing: 20) {
                            ForEach(Array(zip(coinList.indices, coinList)), id: \.0) { i, item in
                                top15CoinRowView(index: i)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text(Section.nft.rawValue)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: layout, spacing: 20) {
                            ForEach(Array(zip(nftList.indices, nftList)), id: \.0) { i, item in
                                top7NFTRowView(index: i)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
            
            
            
            
            .navigationTitle("Crypto Coin")
        }
    }
    
    //MARK: - Init
    
    init() {
        self.coinList = dummyCoin
        self.nftList = dummyNFT
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
    
    private func top15CoinRowView(index i: Int) -> some View {
        VStack {
            HStack {
                Text("\(i + 1)")
                    .font(.title)
                    .bold()
                KFImage.url(URL(string: coinList[i].item.small))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(coinList[i].item.name)
                        .font(.headline)
                    Text(coinList[i].item.symbol)
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    
                    Text("\(coinList[i].item.data.price)")
                        .font(.headline)
                    Text("\(coinList[i].item.data.price_change_percentage_24h.krw)")
                        .font(.caption)
                }
                
            }
            .padding()
            .frame(width: 300)
            Divider()
        }
    }
    
    private func top7NFTRowView(index i: Int) -> some View {
        VStack {
            HStack {
                Text("\(i + 1)")
                    .font(.title)
                    .bold()
                KFImage.url(URL(string: nftList[i].thumb))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(nftList[i].name)
                        .font(.headline)
                    Text(nftList[i].symbol)
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(nftList[i].data.floor_price)
                        .font(.headline)
                    Text(nftList[i].data.floor_price_in_usd_24h_percentage_change)
                        .font(.caption)
                }
            }
            .padding()
            .frame(width: 300)
            Divider()
        }
    }
}

#Preview {
    TrendingView()
}
