//
//  ProfileView.swift
//  Recipe
//
//  Created by Jonas Küpper on 02.10.26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Favorites")
                                .font(.title.bold())
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(20)
                    .frame(height: 160)
                    .background(alignment: .bottomTrailing) {
                        ZStack {
                            heart(size: 200, opacity: 0.2)
                            heart(size: 140, opacity: 0.4)
                            heart(size: 90,  opacity: 1)
                        }
                        .rotationEffect(.degrees(15))
                        .offset(x: 50, y: 45)
                        .accessibilityHidden(true)
                    }
                    .background(Color.red.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                }
                .buttonStyle(.plain)
                
                Spacer()
            }
            .safeAreaPadding()
        }
        
    }
    
    private func heart(size: CGFloat, opacity: Double) -> some View {
        Image(systemName: "heart.fill")
            .font(.system(size: size))
            .foregroundStyle(.red)
            .opacity(opacity)
    }
}

#Preview {
    ProfileView()
}
