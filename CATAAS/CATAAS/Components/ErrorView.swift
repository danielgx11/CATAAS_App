//
//  ErrorView.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let errorIconName = "error-icon"
    }
    
    // MARK: - PROPERTIES
    
    let textMessage: String
    
    // MARK: - UI
    
    var body: some View {
        VStack(spacing: Metrics.small) {
            Image(Constants.errorIconName)
                .resizable()
                .scaledToFit()
                .frame(width: Metrics.extraBig, height: Metrics.extraBig)
            
            Text(textMessage)
                .foregroundStyle(Colors.textSecondary.color)
                .font(.headline)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

#Preview {
    ErrorView(textMessage: "Something went wrong here")
}
