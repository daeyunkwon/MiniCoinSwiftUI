//
//  TrendingViewModel.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/11/24.
//

import Foundation
import Combine

final class TrendingViewModel: ViewModelType {
    
    var cancellables = Set<AnyCancellable>()
    var input = Input()
    @Published var output = Output()
    
    struct Input {
        let viewOnTask = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var coinList: [CoinItem] = []
        var nftList: [NFTItem] = []
    }
    
    init() {
        transform()
    }
    
    func transform() {
        input.viewOnTask
            .sink { [weak self] _ in
//                self?.fetchData()
                self?.setupDummy()
            }
            .store(in: &cancellables)
    }
    
    private func setupDummy() {
        self.output.coinList = dummyCoin
        self.output.nftList = dummyNFT
    }
    
    private func fetchData() {
        NetworkManager.shared.performRequest(api: .trending, model: CoinData.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.coinList = data.coins
                self?.output.nftList = data.nfts
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TrendingViewModel {
    
    enum Action {
        case onTask
    }
    
    func action(_ action: Action) {
        input.viewOnTask.send(())
    }
}
