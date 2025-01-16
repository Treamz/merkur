//
//  SpaceMissionListView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI


struct SpaceMissionListView: View {
    let missions: [SpaceMission] = spaceMissions
    
    var body: some View {
        NavigationStack {
            ZStack {
              // TODO: background layer
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(missions) { mission in
                            NavigationLink(destination: SpaceMissionDetailView(selectedMission: mission)) {
                                SpaceMissionCardView(mission: mission)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .navigationTitle("Space Missions")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
}

#Preview {
    SpaceMissionListView()
}
