//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Matin Massoudi on 7/14/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

import Foundation


//Only to elements where generic element conforms to identifiable protocol.
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
