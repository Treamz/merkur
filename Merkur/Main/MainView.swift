//
//  MainView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI
import RiveRuntime
import SceneKit
import Translation

struct MainView: View {
    // State Variables
     @State private var selectedCategory: String?
     
    @State private var planetModel = PlanetsModel()
    
    @State private var planets = "Planets"
    
    @State private var configuration: TranslationSession.Configuration?

    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                RiveViewModel(fileName:"cosmos").view().ignoresSafeArea()
                    .scaleEffect(3)

                
                // Main Content Layer
                VStack(spacing: 24) {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                        .frame(height: 40)
                        .mask(Text("MERKUR")
                            .font(.system(size: 44, weight: .bold)))
                        .kerning(8)
                        .padding(.bottom, 12)
                    
                    MySceneView(modelName: planetModel.models[3].modelName)
                        .frame(width: 400, height: 400)

                    
                    VStack(spacing: 16) {
                        Button {
                            selectedCategory = "Planets"
                        } label: {
                            NavigationLink(destination: PlanetListView()) {
                                Text(planets)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(width: 300, height: 50)
                                    .background(Color.indigo)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        
//                        Button {
//                            selectedCategory = "Space Missions"
//                        } label: {
//                            NavigationLink(destination: SpaceMissionListView()) {
//                                Text("Space Missions")
//                                    .font(.headline)
//                                    .foregroundStyle(.white)
//                                    .frame(width: 300, height: 50)
//                                    .background(Color.purple)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            }
//                        }
                    }
                }
            }
            .onAppear(perform: {
                if configuration == nil {
                    let locale = Locale.deviceLanguage()
                    print(locale)
                    if  locale != "en" {
                        self.configuration = TranslationSession.Configuration(source: Locale(identifier: "en").language, target: Locale.Language(identifier:locale))
                                           } else {
                                               self.configuration?.invalidate()
                                           }
                    }
            })
            .translationTask(configuration) { session in
                       do {
                           let response = try await session.translate(planets)
                           self.planets = response.targetText
                       } catch let error {
                           print(error)
                       }
                   }
        }
    
    }
}

#Preview {
    MainView()
}


extension Locale {
    static func deviceLanguage() -> String {
        let preferredLanguages = Locale.preferredLanguages
        if let deviceLanguage = preferredLanguages.first {
            return String(deviceLanguage.prefix(2))
        } else {
            print("📕: Could not determine the device language.")
            return "en" // Default to English if language is not determined
        }
    }
}
