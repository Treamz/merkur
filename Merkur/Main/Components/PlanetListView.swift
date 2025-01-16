//
//  PlanetListView.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//


import SwiftUI
import RiveRuntime
import SceneKit
struct PlanetListView: View {
    // initialize planet data
    private let planets: [Planet] = [.mercury, .venus, .earth, .mars, .jupiter, .saturn, .uranus, .neptune, .pluto]
    
    
    var body: some View {

                
        
            NavigationStack {
                ZStack {
                    RiveViewModel(fileName:"cosmos").view().ignoresSafeArea()
                        .scaleEffect(3)
                    // main content layer
                    
//                    PantoneStyleColorChips()
//                                   .zIndex(1)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<planets.count) { index in
                                PlanetItemList(planet: planets[index])
                            
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .fill(.ultraThinMaterial)
//                                        .overlay(content: {
//                                            MySceneView(modelName: planets[index].details.fileName)
//                                                .frame(width:200,height:200)
//                                                .scaleEffect(2)
//                                        })
//                                        .containerRelativeFrame(.horizontal)
//                                        .scrollTransition(axis:.horizontal) { content, phase in
//                                            content
//                                                .rotation3DEffect(.degrees(phase.value  * 30), axis: (x: phase.value,y: 1,z: 0))
//                                                .scaleEffect(phase.isIdentity ? 1 : 0.8)
//                                        }
//                                    ZStack(alignment: .top) {
//                                        VStack(spacing: 30) {
//                                            Text(planets[index].details.name)
//                                                .font(.title)
//                                                .padding()
//                                            Spacer()
//                                            
//                                            NavigationLink(destination: PlanetDetailView(selectedPlanet: planets[index])) {
//                                                PlanetCardView(planet: planets[index])
//                                            }
//                                            .buttonStyle(.plain)
//                                        }
//                                    }
//                                }
                                
                            }
                        }
                        .scrollTargetLayout()

                    }
                    .scrollTargetBehavior(.viewAligned)

                    .contentMargins(20)
                    .scrollIndicators(.hidden)
                    .navigationTitle("planetGallery")
                    .navigationBarTitleDisplayMode(.large)
                }
            }
            .colorScheme(.dark)

    }
}

struct Colorchip: View {
    let planetName: String
    let name: String
    let scale: CGFloat
    
    var body: some View {
        let width: CGFloat = 57*scale
        let height: CGFloat = 90*scale
        
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                MySceneView(modelName: name)
                    .scaleEffect(2)
                Spacer()
            }
            .padding(.horizontal, 5)
            .frame(width: width - 3 * scale, height: height / 3.5)
//            .background(RoundedRectangle(cornerRadius: 5)
//                            .fill(Color.white))
            
        }
        .padding(3)
        .frame(width: width, height: height)
        .contentShape(Rectangle())

//        .background(RoundedRectangle(cornerRadius: 5).fill(.clear))
    }
    
    init(name: String, scale: CGFloat, planetName: String) {
        self.name = name
        self.scale = scale
        self.planetName = planetName
    }
}


struct PantoneStyleColorChips: View {
    var chipShapes: [Colorchip]
    let zIndexPreset: [Double]
    let planets: [Planet] = [.mercury, .venus, .earth, .mars, .jupiter, .saturn, .uranus, .neptune, .pluto]
    
    
    init() {
        chipShapes = [Colorchip]()
        
        for i in (0..<planets.count) {
            self.chipShapes.append(
                Colorchip(name: planets[i].details.fileName,
                         
                          scale: 2,planetName: planets[i].details.name)
            )
        }
        
        self.zIndexPreset = (1...self.chipShapes.count).map({ value in Double(value) / Double(360) }).reversed()
    }
    
    @State var delta: Double = 0 // Change in angle
    @State var currentAngle: Double = 0
    @State var currentCard: Int = 0 // Currently selected card
    @State var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged{ val in
                isDragging = true
                delta = val.translation.width
                
                // Calculate the cards corresponding to the current location
                // CurrentCard = -round(Current angle(360 ~ -360) / Unit angle).
                let tempCurrentCard = -Int(round(Double(currentAngle + delta) / Double(360 / chipShapes.count))) % chipShapes.count
                
                // If CurrentCard is negative, make it positive.
                withAnimation(.easeInOut(duration: 0.1)) {
                    if tempCurrentCard < 0 {
                        currentCard = tempCurrentCard + chipShapes.count
                    } else {
                        currentCard = tempCurrentCard
                    }
                }
            }
            .onEnded { val in
                isDragging = false
                currentAngle += delta
                currentAngle = Double((Int(currentAngle) % 360)) // Make currentAngle between -360` ~ 360`
            }
        
        
        ZStack {
            // You can add offset if the cards pop out too early
            let angleOffset: Double = -30

            ForEach(0 ..< chipShapes.count) { index in
                // Caculate absolute index relative to 0 degree
                let relativeIndex =
                index - currentCard < 0 ? (index - currentCard + chipShapes.count) : (index - currentCard)
                
                // relativeIndex still can't solve problem.
                // Because the frontmost card has an relativeIndex greater than 0, it is eventually covered by card at 0.
                // correctdRelativeIndex is created to solve the problem
                let correctdRelativeIndex = relativeIndex + chipShapes.count/2 >= chipShapes.count ? relativeIndex + chipShapes.count/2 - chipShapes.count : relativeIndex + chipShapes.count/2
                
                ZStack(alignment: .top) {
                    chipShapes[index]
                        .offset(y: currentCard == index ? 100 : 0) // To pop out
                    
                    ZStack(alignment: .bottomTrailing) {
                        VStack(spacing: 0) {
                            Rectangle()
                                .fill(Color.white.opacity(0.1))
                                .frame(width: 57*2.5, height: 90*2.5)
                        }
                        Text(planets[index].details.name)
                            .font(Font.custom("HelveticaNeue-Bold", size: 15))
                            .rotationEffect(.degrees(90))
                            .padding(10)
                    }
                    .zIndex(1)
                }

                .rotationEffect(.degrees(-90))
                .rotation3DEffect(
                    .degrees(  //
                        angleOffset + (Double(360 / chipShapes.count) * Double(index) +
                                       (isDragging ? currentAngle + delta : currentAngle))),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: UnitPoint(x: -2, y: -1.5),
                    perspective: 0.1)
                .zIndex(zIndexPreset[correctdRelativeIndex])
            }
            .shadow(radius: 5, x: 5, y: 0)
            .offset(x: -100) // To prevent the cards from being cut when it pops out
            .gesture(dragGesture)
        }
    }
}




#Preview {
    PlanetListView()
}
