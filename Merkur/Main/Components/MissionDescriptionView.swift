//
//  MissionDescriptionView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI


struct MissionDescriptionView: View {
    let selectedMission: SpaceMission
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(selectedMission.missionCategory)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(5)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Text(String(selectedMission.year))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(5)
                            .background(Color.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    Text("🛰️ Mission Details")
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .padding(.top)
                    
                    Text(selectedMission.missionDescription)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    Text("👨🏻‍🚀 Crew Members")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    let columns = [
                        GridItem(.flexible(), alignment: .leading),
                        GridItem(.flexible(), alignment: .leading)
                    ]
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(selectedMission.crewNames.indices, id: \.self) { member in
                            Text(selectedMission.crewNames[member])
                                .font(.body)
                                .fontWeight(.medium)
                                .frame(width: 165, height: 44)
                                .foregroundStyle(.white)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    
                }
                .padding()
            }
            Spacer()
            
            Button(action: {
                isPresented = false
            }, label: {
                Text("Close")
                    .font(.headline)
                    .foregroundStyle(Color.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.2))
                    )
                    .padding(.horizontal)
            })
            .padding(.bottom)
            .navigationTitle(Text("🚀 \(selectedMission.name)"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MissionDescriptionView(selectedMission: spaceMissions[4], isPresented: .constant(false))
}
