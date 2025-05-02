//
//  Theme.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import Foundation
import SwiftUI

struct Theme {
    static let colors = Colors()
    
    struct Colors {
        let background = Color.black
        let surface = Color(white: 0.12)
        let textPrimary = Color.white
        let textSecondary = Color(white: 0.7)
        let textTertiary = Color(white: 0.5)
        let accent = Color.blue
        let positive = Color(hex: "00CC66")
        let negative = Color(hex: "FF3333")
        let tabInactive = Color(white: 0.5)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
