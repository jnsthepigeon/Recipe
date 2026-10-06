//
//  GlassIconButton.swift
//  Recipe
//
//  Created by Jonas Küpper on 05.10.26.
//

import SwiftUI

struct GlassIconButton: View {
    let systemImage: String
    var size: CGFloat = 54
    var tint: Color? = nil
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: size * 0.35, weight: .semibold))
                .foregroundStyle(.black)
                .frame(width: size, height: size)
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .glassEffect(.regular.tint(tint).interactive(), in: .circle)
    }
}

#Preview {
    GlassIconButton(systemImage: "house", size: 100) {
        
    }
}
