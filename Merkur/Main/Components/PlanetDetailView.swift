//
//  PlanetDetailView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import SwiftUI
import RiveRuntime
import Translation
struct PlanetDetailView: View {
    let selectedPlanet: Planet
    
    @State private var fact = ""
    @State private var factTranslated = ""

    @State private var getRandomFact = "GET RANDOM FACT"
    @State private var numberOfMoons = "Number of Moons"
    @State private var orbiting = "Orbiting"
    @State private var orbitPeriod = "Orbit Period"
    @State private var diameter = "Diameter"
    @State private var kilometers = "Kilometers"
    @State private var surfaceTemperature = "Surface Temperature"
    @State private var average = "Average"
    
    
    @State private var configuration: TranslationSession.Configuration?
    @State private var configurationFact: TranslationSession.Configuration?
    
    var body: some View {
        ZStack {
            // background
            RiveViewModel(fileName:"cosmos").view().ignoresSafeArea()
                .scaleEffect(3)
            
            // main content layer
            ScrollView {
                VStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                        .frame(height: 40)
                        .mask(Text(selectedPlanet.details.name.uppercased())
                            .font(.system(size: 44, weight: .bold)))
                        .kerning(8)
                        .padding(.bottom, 12)
                    
                    // Planet image
                    MySceneView(modelName: selectedPlanet.details.fileName, rotate: true)
                        .frame(height: 300)
                    
                    
                    // metric cards
                    VStack(spacing: 16) {
                        HStack(spacing: 16) {
                            // Moon Card
                            MetricCardView(title: numberOfMoons,
                                           metric: "\(selectedPlanet.details.numberOfMoons)",
                                           description: orbiting)
                            
                            // Orbit Period Card
                            MetricCardView(title: orbitPeriod,
                                           metric: "\(selectedPlanet.details.formattedOrbitPeriod.value)",
                                           description: selectedPlanet.details.formattedOrbitPeriod.unit)
                        }
                        
                        HStack(spacing: 16) {
                            // Diameter Card
                            MetricCardView(title: diameter,
                                           metric: selectedPlanet.details.formattedDiameter,
                                           description: kilometers)
                            
                            // Surface Temperature Card
                            MetricCardView(title: surfaceTemperature,
                                           metric: selectedPlanet.details.formattedTemperature,
                                           description: "Average")
                        }
                    }
                    
                    VStack {
                        if !factTranslated.isEmpty {
                            Text(factTranslated)
//                                .onAppear(perform: {
//                                    let locale = Locale.deviceLanguage()
//
//                                    if  locale != "en" {
//                                        guard configurationFact == nil else {
//                                            configurationFact?.invalidate()
//                                            return
//                                        }
//                                        configurationFact = TranslationSession.Configuration(
//                                            source: Locale(identifier: "en").language,
//                                            target: Locale(identifier: Locale.deviceLanguage()).language)
//                                
//                                    
//                                    }
//                                })
                              
                                .padding()
                                .foregroundStyle(.white)
                            
                        }
                        Button {
                            fact = selectedPlanet.details.facts.randomElement() ?? ""
                            print("Tap")
                            
                        } label: {
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                                .frame(height: 40)
                                .mask(Text(getRandomFact)
                                    .font(.system(size: 18, weight: .bold)))
                                .kerning(8)
                                .padding(.bottom, 12)
                            
                        }
                        .cornerRadius(24)
                        .padding(.top)
                        .buttonStyle(.plain)
                        .foregroundStyle(.white)
                    }
                    .translationTask(configurationFact) { session in
                        do {
                            let response = try await session.translate(fact)
                            
                            print("NEW FACT")
                            self.factTranslated = response.targetText
                            
                        } catch let error {
                            print(error)
                        }
                    }
                    .onChange(of: fact, { oldValue, newValue in
                        print("ONCHANGE \(newValue)")
                        guard oldValue != newValue else {
                            print("RETURN \(oldValue) \(newValue)")
                            return
                        }
                        let locale = Locale.deviceLanguage()

                        if  locale != "en" {
                            guard configurationFact == nil else {
                                configurationFact?.invalidate()
                                return
                            }
                         
                            configurationFact = TranslationSession.Configuration(
                                source: Locale(identifier: "en").language,
                                target: Locale(identifier: Locale.deviceLanguage()).language)
                        }
                        
                       
                    })
                    .translationTask(configuration) { session in
                        do {
                            let response2 = try await session.translate(getRandomFact)
                            let response3 = try await session.translate(numberOfMoons)
                            let response4 = try await session.translate(orbiting)
                            let response5 = try await session.translate(orbitPeriod)
                            let response6 = try await session.translate(diameter)
                            let response7 = try await session.translate(kilometers)
                            let response8 = try await session.translate(surfaceTemperature)
                            let response9 = try await session.translate(average)
                            
                            self.getRandomFact = response2.targetText
                            self.diameter = response6.targetText
                            self.numberOfMoons = response3.targetText
                            self.orbitPeriod = response5.targetText
                            self.orbiting = response4.targetText
                            self.kilometers = response7.targetText
                            self.surfaceTemperature = response8.targetText
                            self.average = response9.targetText
                        } catch let error {
                            print(error)
                        }
                    }
                    .onAppear {
                        let locale = Locale.deviceLanguage()
                        
                        if  locale != "en" {
                            guard configuration == nil else {
                                configuration?.invalidate()
                                return
                            }
                            configuration = TranslationSession.Configuration(
                                source: Locale(identifier: "en").language,
                                target: Locale(identifier: Locale.deviceLanguage()).language)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PlanetDetailView(selectedPlanet: Planet.earth)
}
