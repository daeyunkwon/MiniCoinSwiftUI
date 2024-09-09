//
//  Coin.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import Foundation

struct CoinData: Decodable {
    let coins: [CoinItem]
}

struct CoinItem: Decodable {
    let item: Coin
}

struct Coin: Decodable {
    let id: String
    let name: String
    let symbol: String
    let small: String
    let data: CoinPrice
}

struct CoinPrice: Decodable {
    let price: Double
    let price_change_percentage_24h: CoinPriceChange
}

struct CoinPriceChange: Decodable {
    let krw: Double
}

var dummy: [CoinItem] = [MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "ginnan-the-cat", name: "Ginnan The Cat", symbol: "GINNAN", small: "https://coin-images.coingecko.com/coins/images/39466/small/ginnan_logo_final.png?1724116323", data: MiniCoinSwiftUI.CoinPrice(price: 3.5889128592110376e-06, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 11.114519730793388)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "simon-s-cat", name: "Simon\'s Cat", symbol: "CAT", small: "https://coin-images.coingecko.com/coins/images/39765/small/Simon\'s_Cat_Logo.png?1724017505", data: MiniCoinSwiftUI.CoinPrice(price: 2.8159632443835244e-05, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 5.545691583653947)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "sui", name: "Sui", symbol: "SUI", small: "https://coin-images.coingecko.com/coins/images/26375/small/sui_asset.jpeg?1696525453", data: MiniCoinSwiftUI.CoinPrice(price: 0.9086519402141509, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: -2.276020809810328)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "tokenize-xchange", name: "Tokenize Xchange", symbol: "TKX", small: "https://coin-images.coingecko.com/coins/images/4984/small/TKX_-_Logo_-_RGB-15.png?1696505519", data: MiniCoinSwiftUI.CoinPrice(price: 8.233463497912798, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 3.21290056027055)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "dogs-2", name: "Dogs", symbol: "DOGS", small: "https://coin-images.coingecko.com/coins/images/39699/small/dogs_logo_200x200.png?1723687163", data: MiniCoinSwiftUI.CoinPrice(price: 0.0010133628337729412, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 5.759008773912462)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "the-open-network", name: "Toncoin", symbol: "TON", small: "https://coin-images.coingecko.com/coins/images/17980/small/img-ton.jpg?1724681212", data: MiniCoinSwiftUI.CoinPrice(price: 5.106945062929485, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 8.042662570110608)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "neiro-on-eth", name: "Neiro on ETH", symbol: "NEIRO", small: "https://coin-images.coingecko.com/coins/images/39438/small/Neiro.png?1722915026", data: MiniCoinSwiftUI.CoinPrice(price: 0.16399985989826493, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 12.961937589835776)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "solana", name: "Solana", symbol: "SOL", small: "https://coin-images.coingecko.com/coins/images/4128/small/solana.png?1718769756", data: MiniCoinSwiftUI.CoinPrice(price: 129.02984729204437, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 1.7709270278180982)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", small: "https://coin-images.coingecko.com/coins/images/1/small/bitcoin.png?1696501400", data: MiniCoinSwiftUI.CoinPrice(price: 55527.03147381057, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 3.477482715580657)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "ondo-finance", name: "Ondo", symbol: "ONDO", small: "https://coin-images.coingecko.com/coins/images/26580/small/ONDO.png?1696525656", data: MiniCoinSwiftUI.CoinPrice(price: 0.613910652458138, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 7.304002091062781)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "metaplex", name: "Metaplex", symbol: "MPLX", small: "https://coin-images.coingecko.com/coins/images/27344/small/mplx.png?1696526391", data: MiniCoinSwiftUI.CoinPrice(price: 0.2574006411496514, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 4.739765865353269)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "ethereum", name: "Ethereum", symbol: "ETH", small: "https://coin-images.coingecko.com/coins/images/279/small/ethereum.png?1696501628", data: MiniCoinSwiftUI.CoinPrice(price: 2303.83151265776, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 2.656187738336712)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "kaspa", name: "Kaspa", symbol: "KAS", small: "https://coin-images.coingecko.com/coins/images/25751/small/kaspa-icon-exchanges.png?1696524837", data: MiniCoinSwiftUI.CoinPrice(price: 0.15622401040413803, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 6.566147138693723)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "rocket-pool", name: "Rocket Pool", symbol: "RPL", small: "https://coin-images.coingecko.com/coins/images/2090/small/rocket_pool_%28RPL%29.png?1696503058", data: MiniCoinSwiftUI.CoinPrice(price: 11.666153358061555, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 26.54594786002209)))), MiniCoinSwiftUI.CoinItem(item: MiniCoinSwiftUI.Coin(id: "pepe", name: "Pepe", symbol: "PEPE", small: "https://coin-images.coingecko.com/coins/images/29850/small/pepe-token.jpeg?1696528776", data: MiniCoinSwiftUI.CoinPrice(price: 7.095898049664044e-06, price_change_percentage_24h: MiniCoinSwiftUI.CoinPriceChange(krw: 4.1692317874784415))))]
