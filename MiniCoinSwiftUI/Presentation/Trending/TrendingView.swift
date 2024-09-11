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
    
    @StateObject private var viewModel = TrendingViewModel()
    
    enum Section: String, CaseIterable {
        case favorite = "My Favorite"
        case coin = "Top15 Coin"
        case nft = "Top7 NFT"
    }
    
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
                            ForEach(Array(zip(viewModel.output.coinList.indices, viewModel.output.coinList)), id: \.0) { i, item in
                                top15CoinRowView(index: i, item: viewModel.output.coinList[i].item)
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
                            ForEach(Array(zip(viewModel.output.nftList.indices, viewModel.output.nftList)), id: \.0) { i, item in
                                top7NFTRowView(index: i, item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Crypto Coin")
        }
        
        .task {
            viewModel.action(.onTask)
        }
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
    
    private func top15CoinRowView(index i: Int, item: Coin) -> some View {
        VStack {
            HStack {
                Text("\(i + 1)")
                    .font(.title)
                    .bold()
                KFImage.url(URL(string: item.small))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.symbol)
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    
                    Text("\(item.data.price)")
                        .font(.headline)
                    Text("\(item.data.price_change_percentage_24h.krw)")
                        .font(.caption)
                        .foregroundStyle(item.data.price_change_percentage_24h.krw < 0 ? .blue : .red)
                }
                
            }
            .padding()
            .frame(width: 300)
            Divider()
        }
    }
    
    private func top7NFTRowView(index i: Int, item: NFTItem) -> some View {
        VStack {
            HStack {
                Text("\(i + 1)")
                    .font(.title)
                    .bold()
                KFImage.url(URL(string: item.thumb))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.symbol)
                        .font(.caption)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(item.data.floor_price)
                        .font(.headline)
                    Text(item.data.floor_price_in_usd_24h_percentage_change)
                        .font(.caption)
                        .foregroundStyle(Double(item.data.floor_price_in_usd_24h_percentage_change) ?? 0.0 < 0 ? .blue : .red)
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
