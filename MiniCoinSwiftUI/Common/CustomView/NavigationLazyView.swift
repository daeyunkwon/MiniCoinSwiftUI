//
//  NavigationLazyView.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    
    var body: some View {
        build()
    }
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
}
