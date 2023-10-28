//
//  Double+Extensions.swift
//  shopping-cart
//
//  Created by Osman Yıldız on 28.10.2023.
//

import Foundation

extension Double {
    func roundedToTwoDecimalPlaces() -> Double {
        let div = pow(10.0, Double(2))
        return (self * div).rounded() / div
    }
}
