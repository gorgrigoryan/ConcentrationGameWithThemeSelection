//
//  Card.swift
//  Concentration
//
//  Created by 1 on 9/6/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

extension Card {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
