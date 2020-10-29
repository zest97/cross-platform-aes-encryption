//
//  TextfieldMaxLength.swift
//  aes_encryption
//
//  Created by T942488 on 30/10/2020.
//

import SwiftUI
import Combine

class TextLimiter: ObservableObject {
    private let limit: Int
    
    init(limit: Int) {
        self.limit = limit
    }
    
    @Published var value = "" {
        didSet {
            if value.count > self.limit {
                self.hasReachedLimit = true
            } else {
                self.hasReachedLimit = false
            }
        }
    }
    @Published var hasReachedLimit = false
}

