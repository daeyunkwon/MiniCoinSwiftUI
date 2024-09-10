//
//  ViewModelType.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/11/24.
//

import Foundation
import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    var input: Input { get set }
    var output: Output { get set }
    
    func transform()
}
