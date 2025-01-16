//
//  SpaceMission.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import Foundation

import Foundation

struct SpaceMission: Identifiable {
    let id = UUID()
    let name: String
    let year: Int
    let duration: Int
    let numberOfCrew: Int
    let imageName: String
    let fourthMetricDescription: String
    let fourthMetric: Int
    let missionDescription: String
    let missionCategory: String
    let crewNames: [String]
    
    // computed property for duration string
    var durationFormatted: String {
        "\(duration) days"
    }
    
}

// data model
let spaceMissions: [SpaceMission] = [
    SpaceMission(name: "Gemini 9A",
                 year: 1966,
                 duration: 3,
                 numberOfCrew: 2,
                 imageName: "GT-9",
                 fourthMetricDescription: "Number of EVAs",
                 fourthMetric: 1,
                 missionDescription: """
                 Gemini 9A, launched on June 3, 1966, aimed to test rendezvous and docking techniques and conduct two extra-vehicular activities (EVAs). The mission faced initial challenges when the original docking target vehicle failed to achieve orbit.
                 
                 Despite a failed docking attempt due to a protective shroud not fully detaching, astronaut Gene Cernan performed a two-hour EVA, demonstrating the difficulty of maneuvering outside the spacecraft. The mission provided crucial data that helped shape future EVA suits and procedures.
                 """,
                 missionCategory: "Manned",
                 crewNames: ["Thomas Stafford", "Eugene Cernan"]),
    
    SpaceMission(name: "Apollo 10",
                 year: 1969,
                 duration: 8,
                 numberOfCrew: 3,
                 imageName: "Apollo-10",
                 fourthMetricDescription: "Lunar Orbits",
                 fourthMetric: 31,
                 missionDescription: """
                 Apollo 10 served as the final "dress rehearsal" for the moon landing, launched on May 18, 1969. It was designed to test all procedures and components before the actual Moon landing without making the final descent.
                 
                 The crew took the Lunar Module to within 8.4 nautical miles of the lunar surface, testing its systems in lunar orbit. This mission confirmed the performance of the Lunar Module and set the stage for the historic Apollo 11 landing.
                """,
                 missionCategory: "Lunar",
                 crewNames: ["Thomas Stafford", "John Young", "Eugene Cernan"]),
    
    SpaceMission(name: "Apollo 11",
                 year: 1969,
                 duration: 8,
                 numberOfCrew: 3,
                 imageName: "Apollo-11",
                 fourthMetricDescription: "Moonwalks",
                 fourthMetric: 1,
                 missionDescription: """
                 Launched on July 16, 1969, Apollo 11 was the historic mission that first landed humans on the Moon and safely returned them to Earth, fulfilling President Kennedy's national goal.

                 Neil Armstrong and Buzz Aldrin spent 21 hours on the lunar surface, collecting samples and deploying scientific experiments. Their successful return marked a major triumph in human space exploration.
                 """,
                 missionCategory: "Lunar",
                 crewNames: ["Neil Armstrong", "Buzz Aldrin", "Michael Collins"]),
    
    SpaceMission(name: "Apollo 13",
                 year: 1970,
                 duration: 5,
                 numberOfCrew: 3,
                 imageName: "Apollo-13",
                 fourthMetricDescription: "Modules Docked",
                 fourthMetric: 0,
                 missionDescription: """
                 Famously launched on April 11, 1970, with the goal of landing at Fra Mauro on the Moon. However, the mission was abruptly altered by an oxygen tank explosion two days into the flight.
                 
                 The crew, along with mission control, ingeniously modified the Lunar Module into a 'lifeboat' to survive the journey around the Moon and back to Earth. This mission is now celebrated as a "successful failure" due to the safe return of its crew.
                 """,
                 missionCategory: "Lunar",
                 crewNames: ["James Lovell", "John Swigert", "Fred Haise"]),
    
    SpaceMission(name: "STS-1",
                 year: 1981,
                 duration: 2,
                 numberOfCrew: 2,
                 imageName: "STS-1",
                 fourthMetricDescription: "Orbits around Earth",
                 fourthMetric: 36,
                 missionDescription:"""
                STS-1, the first orbital flight of NASA's Space Shuttle program, launched on April 12, 1981. It marked the first time a new spacecraft was tested with a crew aboard.

                Commanded by John Young and piloted by Robert Crippen, the mission lasted 54 hours and orbited the Earth 36 times, testing all systems and marking a new era of reusable spacecraft.
                """,
                 missionCategory: "Manned",
                 crewNames: ["John Young", "Robert Crippen"]),
    
    SpaceMission(name: "STS-7",
                 year: 1983,
                 duration: 6,
                 numberOfCrew: 5,
                 imageName: "STS-7",
                 fourthMetricDescription: "Satellites Deployed",
                 fourthMetric: 2,
                 missionDescription: """
                 STS-7, launched on June 18, 1983, was Challenger’s second flight but notable for carrying Sally Ride, who became the first American woman in space.
                 
                 The mission deployed several satellites and tested the Canadian-built robotic arm in orbit, showcasing the versatility of Shuttle missions in deploying and interacting with payloads in space.
                 """,
                 missionCategory: "Manned",
                 crewNames: ["Robert Crippen", "Frederick Hauck", "John Fabian", "Sally Ride", "Norman Thagard"]),
    
    SpaceMission(name: "STS-28",
                 year: 1988,
                 duration: 5,
                 numberOfCrew: 5,
                 imageName: "STS-28",
                 fourthMetricDescription: "Classifed Payloads",
                 fourthMetric: 1,
                 missionDescription: """
                 Launched on August 8, 1989, STS-28 was a dedicated Department of Defense mission, shrouded in secrecy, which often characterizes DoD missions aboard the Shuttle.
                 
                 Although most details remain classified, the mission is known to have deployed a payload and performed significant in-orbit operations, contributing to national security.
                 """,
                 missionCategory: "Manned",
                 crewNames: ["Brewster Shaw", "Richard Richards", "David Leestma", "James Adamson", "Mark Brown"]),
    
    SpaceMission(name: "STS-31",
                 year: 1990,
                 duration: 5,
                 numberOfCrew: 5,
                 imageName: "STS-31",
                 fourthMetricDescription: "Deployed Statellites",
                 fourthMetric: 1,
                 missionDescription: """
                 STS-31, launched on April 24, 1990, is famous for deploying the Hubble Space Telescope into orbit, revolutionizing many fields of astrophysics.
                 
                 Beyond deploying Hubble, the mission's success set the stage for numerous servicing missions, ensuring Hubble’s contributions to astronomy for decades.
                 """,
                 missionCategory: "Research",
                 crewNames: ["Loren Shriver", "Charles Bolden", "Steven Hawley", "Bruce McCandless", "Kathryn Sullivan"]),
    
    SpaceMission(name: "Demo-2",
                 year: 2020,
                 duration: 64,
                 numberOfCrew: 2,
                 imageName: "Demo-2",
                 fourthMetricDescription: "Commercial Flight",
                 fourthMetric: 1,
                 missionDescription: """
                 Launched on May 30, 2020, SpaceX Demo-2 was the first crewed flight of the Crew Dragon spacecraft, testing the vessel’s end-to-end capabilities.
                 
                 Astronauts Bob Behnken and Doug Hurley successfully docked with the International Space Station, marking a new era of commercial crew spaceflights in partnership with NASA.
                 """,
                 missionCategory: "Commercial",
                 crewNames: ["Robert Behnken", "Douglas Hurley"]),
    
    SpaceMission(name: "Expedition 66",
                 year: 2021,
                 duration: 180,
                 numberOfCrew: 5,
                 imageName: "Expedition-66",
                 fourthMetricDescription: "Spacewalks",
                 fourthMetric: 4,
                 missionDescription: """
                 Launched on May 30, 2020, SpaceX Demo-2 was the first crewed flight of the Crew Dragon spacecraft, testing the vessel’s end-to-end capabilities.

                 Astronauts Bob Behnken and Doug Hurley successfully docked with the International Space Station, marking a new era of commercial crew spaceflights in partnership with NASA.
                 """,
                 missionCategory: "Research",
                 crewNames: ["Thomas Pesquet", "Megan McArthur", "Shane Kimbrough", "Akihito Hoshide", "Mark Vande-Hei"])
]
