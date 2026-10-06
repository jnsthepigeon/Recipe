//
//  Color.swift
//  Recipe
//
//  Created by Jonas Küpper on 28.09.26.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            red:   Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue:  Double(hex & 0xFF) / 255
        )
    }
    
    static let greenLime = Color(hex: 0xD5FEC7)
    static let greenEnergy = Color(hex: 0xA2FE86)
    static let peach = Color(hex: 0xF8C191)
    static let lime = Color(hex: 0xE8FFB7)
    static let lavender = Color(hex: 0xD0C4FF)
    static let softRed = Color(hex: 0xFFB7B7)
}
