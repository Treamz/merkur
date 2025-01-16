//
//  PlanetItemList.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 05.12.2024.
//
import SwiftUI
import Translation

struct PlanetItemList: View {
    var planet: Planet
    @State private var planetTitle = ""
    @State private var configuration: TranslationSession.Configuration?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .overlay(content: {
                    MySceneView(modelName: planet.details.fileName)
                        .frame(width: 200, height: 200)
                        .scaleEffect(2)
                })
                .containerRelativeFrame(.horizontal)
                .scrollTransition(axis: .horizontal) { content, phase in
                    content
                        .rotation3DEffect(.degrees(phase.value * 30), axis: (x: phase.value, y: 1, z: 0))
                        .scaleEffect(phase.isIdentity ? 1 : 0.8)
                }
            ZStack(alignment: .top) {
                VStack(spacing: 30) {
                    Text(planetTitle)
                        .font(.title)
                        .padding()
                        .translationTask(configuration) { session in
                            Task {
                                do {
                                    let response = try await session.translate(planet.details.name)
                                    self.planetTitle = response.targetText
                                } catch {
                                    print("Translation error: \(error)")
                                }
                            }
                        }
                    Spacer()

                    NavigationLink(destination: PlanetDetailView(selectedPlanet: planet)) {
                        PlanetCardView(planet: planet)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .onAppear {
            planetTitle = planet.details.name
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
    PlanetItemList(planet: Planet.jupiter)
}
