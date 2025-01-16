//
//  MetricCardView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI

struct MetricCardView: View {
    let title: String
    let metric: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
            
            HStack {
                Text(metric)
                    .font(.system(size: metric.count > 4 ? 42 : 44, weight: .bold))
                    .foregroundStyle(.white)
            }
            
            Text(description)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding()
        .frame(width: 175, height: 120, alignment: .leading)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 10)
    }
}

struct CardBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    MetricCardView(title: "Moons", metric: "2", description: "Our only Moon")
}
