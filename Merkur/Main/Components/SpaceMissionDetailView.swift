//
//  SpaceMissionDetailView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI

struct SpaceMissionDetailView: View {
    @State private var showDescriptionSheet: Bool = false
      @State private var animateSpaceMissionBadge: Bool = false
      
      let selectedMission: SpaceMission
      
      var body: some View {
          ZStack {
              // TODO: background layer
              Color.black
                  .ignoresSafeArea()
              
              VStack(spacing: 36) {
                  Rectangle()
                      .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                      .frame(height: 40)
                      .mask(Text(selectedMission.name.uppercased())
                          .font(.system(size: 44, weight: .bold))
                          .kerning(8)
                          .minimumScaleFactor(0.8))
                  
                  Image(selectedMission.imageName)
                      .resizable()
                      .scaledToFit()
                      .shadow(color: .yellow, radius: 3)
                      .scaleEffect(animateSpaceMissionBadge ? 1.05 : 1.0)
                      .animation(.easeInOut(duration: 0.9).repeatCount(3), value: animateSpaceMissionBadge)
                      .onAppear {
                          DispatchQueue.main.async {
                              self.animateSpaceMissionBadge = true
                          }
                      }
                      .onTapGesture {
                          showDescriptionSheet = true
                      }
                      .sheet(isPresented: $showDescriptionSheet, content: {
                          MissionDescriptionView(selectedMission: selectedMission, isPresented: $showDescriptionSheet)
                      })
                  
                  // metric cards
                  VStack(spacing: 16) {
                      HStack(spacing: 16) {
                          MetricCardView(title: "Date of Mission", metric: String(selectedMission.year), description: "Launch Year")
                          MetricCardView(title: "Number of Crew", metric: String(selectedMission.numberOfCrew), description: "Astronauts")
                      }
                      
                      HStack(spacing: 16) {
                          MetricCardView(title: "Mission Duration", metric: String(selectedMission.duration), description: "Total Time - Days")
                          MetricCardView(title: selectedMission.fourthMetricDescription, metric: String(selectedMission.fourthMetric), description: "Completed")
                      }
                  }
              }
          }
      }
}

#Preview {
    SpaceMissionDetailView(selectedMission: spaceMissions[4])
}
