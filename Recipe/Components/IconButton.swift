//
//  IconButton.swift
//  Recipe
//
//  Created by Jonas Küpper on 28.09.26.
//

import SwiftUI

struct IconButton: View {
    let systemImage: String
    var iconWeight: Font.Weight = .regular
    var iconSize: CGFloat = 0.35
    var size: CGFloat = 54
    var tint: Color? = nil
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: size * iconSize, weight: iconWeight))
                .foregroundStyle(.black)
                .frame(width: size, height: size)
                .background(.white, in: Circle())
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
    }
}
