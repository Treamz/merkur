//
//  PlanetCardView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//
import SwiftUI
import Translation

struct PlanetCardView: View {
    // Accept a planet enum case
    let planet: Planet
    
    @State private var name = ""
    @State private var description = ""
    @State private var configuration: TranslationSession.Configuration?

    var body: some View {
        HStack {
            MySceneView(modelName: planet.details.fileName)
                .frame(width: 100, height: 100)
            
            // Planet Name and Description
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)
                    .translationTask(configuration) { session in
                        Task {
                            do {
                                let response = try await session.translate(planet.details.name)
                                self.name = response.targetText
                            } catch {
                                print("Translation error: \(error)")
                            }
                        }
                    }
                
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .translationTask(configuration) { session in
                        Task {
                            do {
                                let response = try await session.translate(planet.details.description)
                                self.description = response.targetText
                            } catch {
                                print("Translation error: \(error)")
                            }
                        }
                    }
            }
            
            Spacer()
            
            // Orbit Number
            Text("\(planet.details.orbitNumber)")
                .font(.system(size: 64))
                .fontWeight(.bold)
                .padding(.trailing, 16)
        }
        .frame(width: 350, height: 116, alignment: .center)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        .onAppear {
            name = planet.details.name
            description = planet.details.description
        }
        .onAppear(perform: configureTranslation)
    }

    private func configureTranslation() {
        let locale = Locale.deviceLanguage()
        print("ON APPEAR \(locale)")
        if locale != "en" {
            configuration = TranslationSession.Configuration(
                source: Locale(identifier: "en").language,
                target: Locale(identifier: Locale.deviceLanguage()).language
            )
        }
    }
}

#Preview {
    PlanetCardView(planet: .earth)
}
