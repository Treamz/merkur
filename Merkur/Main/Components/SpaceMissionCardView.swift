//
//  SpaceMissionCardView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI


struct SpaceMissionCardView: View {
    let mission: SpaceMission
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Image(mission.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(mission.name)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                
                Text(mission.missionDescription)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                    .lineLimit(3)
                
                HStack {
                    Text(mission.missionCategory)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(5)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Text(String(mission.year))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(5)
                        .background(Color.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(.ultraThinMaterial))
        .padding(.horizontal)
    }
}

#Preview {
    SpaceMissionCardView(mission: spaceMissions[0])
}
