//
//  Concentration.swift
//  Concentration
//
//  Created by 1 on 9/6/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): index out of range")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsCards: Int) {
        assert(numberOfPairsCards > 0, "Concentration.init(\(numberOfPairsCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
