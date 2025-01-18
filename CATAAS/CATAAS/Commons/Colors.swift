//
//  Colors.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation
import SwiftUI

enum Colors: CaseIterable {
    case background
    case backgroundAccent
    case brandPrimary
    case brandSecondary
    case accent
    case accentSecondary
    case textSecondary
    case error
    
    var color: Color {
        switch self {
        case .background:
            return Color(hex: "#000000")
        case .backgroundAccent:
            return Color(hex: "#242526")
        case .brandPrimary:
            return Color(hex: "#6200EE")
        case .brandSecondary:
            return Color(hex: "#3700B3")
        case .accent:
            return Color(hex: "#03DAC6")
        case .accentSecondary:
            return Color(hex: "#018786")
        case .textSecondary:
            return Color(hex: "#3A3B3C")
        case .error:
            return Color(hex: "#B00020")
        }
    }
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
