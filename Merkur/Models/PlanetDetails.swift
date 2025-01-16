//
//  PlanetDetails.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import Foundation



struct PlanetDetails: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let numberOfMoons: Int
    let orbitPeriod: Int
    let diameter: Int // in Earth days
    let orbitNumber: Int // in kilometers
    let surfaceTemperate: Int // average, in Celcius
    let fileName: String // 3d object Item
    let facts: [String]
    
    // Return both the period and the unit as a tuple
    var formattedOrbitPeriod: (value: Int, unit: String) {
        if orbitPeriod <= 365 {
            return (orbitPeriod, "Earth Days")
        } else {
            // Convert to years for anything over 365 days
            let years = orbitPeriod / 365
            return (years, "Earth Years")
        }
    }
    
    // Format the diameter and handle decimal point
    var formattedDiameter: String {
        let diameterInThousands = Double(diameter) / 1_000.0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0 // No decimals
        formatter.maximumFractionDigits = 1 // Allow up to three digits after the decimal point, adjust as needed
        
        // This ensures that for Earth, "12742" becomes "12.742", and then "12,742" after formatting.
        if let formattedNumber = formatter.string(from: NSNumber(value: diameterInThousands)) {
            // Append "K" without space to indicate thousands.
            return "\(formattedNumber)k"
        } else {
            // Fallback to the original diameter in kilometers if formatting fails.
            return "\(diameter) km"
        }
    }
    
    // format surface temperature
    var formattedTemperature: String {
        return "\(surfaceTemperate)°c"
    }
}


enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
    
    var details: PlanetDetails {
        switch self {
        case .mercury:
            return PlanetDetails(name: "Mercury", imageName: "Mercury", description: "Mercury has no atmosphere, which means there is no weather",
                                 numberOfMoons: 0, orbitPeriod: 88, diameter: 4878, orbitNumber: 1, surfaceTemperate: 167,fileName: "Mercury.usdz",facts: [
                                    "Mercury is the closest planet to the Sun.",
                                    "A year on Mercury lasts only 88 Earth days.",
                                    "Mercury has no moons.",
                                    "The temperature on Mercury ranges from -173°C to 427°C.",
                                    "Mercury’s surface is covered with craters, like the Moon.",
                                    "Mercury has a very thin atmosphere made up mostly of oxygen, sodium, and hydrogen.",
                                    "Mercury’s day lasts 59 Earth days.",
                                    "Mercury has the most eccentric orbit of all the planets.",
                                    "The planet is named after the Roman god of messages and trade, Mercury.",
                                    "The first space probe to visit Mercury was Mariner 10 in 1974.",
                                    "Mercury is the second densest planet in the solar system after Earth.",
                                    "Mercury has a magnetic field, although it is much weaker than Earth’s.",
                                    "Mercury has no rings.",
                                    "Mercury has extreme temperature variations because it has no atmosphere to trap heat.",
                                    "The surface of Mercury is composed mostly of plains and impact craters.",
                                    "Mercury’s orbit is highly elliptical and takes it from 46 million km to 70 million km from the Sun.",
                                    "Mercury's surface is dark and resembles the Moon's surface.",
                                    "The year on Mercury is shorter than its day.",
                                    "Mercury is the smallest planet in the solar system.",
                                    "Mercury has a weak magnetic field, about 1% the strength of Earth’s.",
                                    "Mercury has no weather as we know it, because it lacks an atmosphere.",
                                    "The planet is covered with cliffs and valleys.",
                                    "Mercury is tidally locked to the Sun, meaning one side faces the Sun constantly.",
                                    "Mercury’s surface temperature can fluctuate drastically from day to night.",
                                    "Mercury’s gravitational pull is about 38% of Earth’s gravity.",
                                    "There are large temperature differences between the day side and the night side of Mercury.",
                                    "Mercury is considered one of the hardest planets to visit due to its proximity to the Sun.",
                                    "In 2008, NASA launched the MESSENGER probe to study Mercury, and it sent back valuable data."
                                 ])
        case .venus:
            return PlanetDetails(name: "Venus", imageName: "Venus", description: "Venus is the hottest planet in our solar system",
                                 numberOfMoons: 0, orbitPeriod: 225, diameter: 12104, orbitNumber: 2, surfaceTemperate: 465,fileName: "Venus.usdz",facts: [    "Venus is the hottest planet in our solar system, with average temperatures around 465°C.",
                                                                                                                                                               "Venus has no moons.",
                                                                                                                                                               "A day on Venus is longer than a year on Venus.",
                                                                                                                                                               "Venus is sometimes called Earth's twin because of its similar size and composition.",
                                                                                                                                                               "Venus has a thick, toxic atmosphere composed mainly of carbon dioxide and clouds of sulfuric acid.",
                                                                                                                                                               "Venus is the second planet from the Sun.",
                                                                                                                                                               "Venus rotates in the opposite direction to most planets in the solar system (retrograde rotation).",
                                                                                                                                                               "A year on Venus lasts 225 Earth days.",
                                                                                                                                                               "Venus’s day lasts 243 Earth days, longer than its year.",
                                                                                                                                                               "Venus has no rings.",
                                                                                                                                                               "The surface pressure on Venus is about 90 times that of Earth’s.",
                                                                                                                                                               "Venus has the most extreme greenhouse effect of any planet in the solar system.",
                                                                                                                                                               "Venus has been visited by more spacecraft than any other planet, including the Soviet Venera program.",
                                                                                                                                                               "Venus’s surface is covered by vast plains of volcanic rock and mountains.",
                                                                                                                                                               "The tallest mountain on Venus is Maxwell Montes, which is 11 km high.",
                                                                                                                                                               "Venus’s atmosphere traps heat, causing it to have a surface temperature hotter than Mercury’s, despite being farther from the Sun.",
                                                                                                                                                               "Venus was named after the Roman goddess of love and beauty.",
                                                                                                                                                               "The planet’s surface is shrouded in thick clouds, making it impossible to see the surface from space.",
                                                                                                                                                               "Venus has volcanoes, and some may still be active today.",
                                                                                                                                                               "Venus has the longest rotation period of any planet in the solar system.",
                                                                                                                                                               "Venus’ clouds are composed of sulfuric acid and reflect 70% of the sunlight that hits them.",
                                                                                                                                                               "Venus has a very slow rotation, taking 243 Earth days to complete one rotation.",
                                                                                                                                                               "The atmosphere of Venus experiences super-rotation, with winds traveling up to 360 km/h.",
                                                                                                                                                               "Venus is the third-brightest object in the sky after the Sun and the Moon.",
                                                                                                                                                               "The surface of Venus is incredibly dry, and scientists believe there may have once been oceans of water.",
                                                                                                                                                               "Venus has a huge lightning storm that occurs in its upper atmosphere.",
                                                                                                                                                               "Venus’s atmosphere is slowly being lost to space due to solar winds and its lack of a magnetic field.",
                                                                                                                                                               "Venus has been studied by NASA’s Magellan spacecraft, which mapped its surface in the 1990s.",
                                                                                                                                                               "Venus is a very Earth-like planet in terms of size, but with vastly different conditions."])
        case .earth:
            return PlanetDetails(name: "Earth", imageName: "Earth", description: "Earth is the only planet not named after a god",
                                 numberOfMoons: 1, orbitPeriod: 365, diameter: 12742, orbitNumber: 3, surfaceTemperate: 15,fileName: "Earth.usdz",facts: [ "Earth is the third planet from the Sun.",
                                                                                                                                                           "Earth has one natural satellite, the Moon.",
                                                                                                                                                           "Earth’s atmosphere is made up of 78% nitrogen, 21% oxygen, and trace amounts of other gases.",
                                                                                                                                                           "Earth is the only known planet to support life.",
                                                                                                                                                           "Earth’s surface is 71% water, with oceans covering most of the surface.",
                                                                                                                                                           "The Earth's core is made up of iron and nickel.",
                                                                                                                                                           "Earth has a magnetic field that helps protect the planet from harmful solar radiation.",
                                                                                                                                                           "The Earth's rotation is gradually slowing down, causing days to get longer over millions of years.",
                                                                                                                                                           "Earth’s axial tilt is responsible for seasons.",
                                                                                                                                                           "The average surface temperature of Earth is about 15°C.",
                                                                                                                                                           "Earth has a rich diversity of ecosystems, ranging from deserts to rainforests.",
                                                                                                                                                           "The Earth’s atmosphere protects life from meteoroids and space debris.",
                                                                                                                                                           "The highest point on Earth is Mount Everest, at 8,848 meters above sea level.",
                                                                                                                                                           "Earth’s oceans hold about 1.332 billion cubic kilometers of water.",
                                                                                                                                                           "The Earth’s orbit around the Sun is slightly elliptical, causing seasonal variation.",
                                                                                                                                                           "Earth’s magnetic field flips every 300,000 years or so.",
                                                                                                                                                           "The Moon stabilizes Earth's axial tilt, which helps moderate the planet's climate.",
                                                                                                                                                           "Earth has a diverse range of animals, from microscopic organisms to large mammals.",
                                                                                                                                                           "Earth’s population is over 8 billion people.",
                                                                                                                                                           "The Earth's biosphere includes millions of species of plants and animals.",
                                                                                                                                                           "Earth is home to several natural resources, including fossil fuels, minerals, and fresh water.",
                                                                                                                                                           "The Earth is gradually warming due to human activities, such as burning fossil fuels.",
                                                                                                                                                           "Earth’s oceans are home to the largest living animals, such as blue whales.",
                                                                                                                                                           "Earth has many different types of climates, including tropical, arctic, and temperate.",
                                                                                                                                                           "The Earth is approximately 4.54 billion years old.",
                                                                                                                                                           "Earth experiences more than 100,000 lightning strikes each day.",
                                                                                                                                                           "The Earth’s moon is about 1/4 the size of Earth.",
                                                                                                                                                           "The Earth’s tectonic plates move slowly, causing earthquakes and volcanic activity.",
                                                                                                                                                           "Earth’s atmosphere helps moderate temperature differences between day and night."])
        case .mars:
            return PlanetDetails(name: "Mars", imageName: "Mars", description: "Mars is home to the tallest mountain in the solar system",
                                 numberOfMoons: 2, orbitPeriod: 687, diameter: 6794, orbitNumber: 4, surfaceTemperate: -65,fileName: "Mars.usdz",facts: [
                                    "Mars is often called the 'Red Planet' because of its reddish appearance.",
                                    "Mars is the 4th planet from the Sun in our solar system.",
                                    "The surface of Mars is covered with iron oxide, giving it its red color.",
                                    "Mars has two moons: Phobos and Deimos.",
                                    "Mars has the tallest volcano in the solar system, Olympus Mons, which is about 13.6 miles (22 km) high.",
                                    "The planet's day is only 40 minutes longer than Earth's, making it 24 hours and 40 minutes long.",
                                    "Mars has the largest canyon in the solar system, Valles Marineris, which stretches for 2,500 miles (4,000 km).",
                                    "Mars’ atmosphere is about 100 times thinner than Earth's.",
                                    "The surface temperature on Mars can drop to as low as -195°F (-125°C) at the poles during winter.",
                                    "Despite being a cold and dry planet, Mars has evidence of ancient riverbeds and signs of past water flow.",
                                    "Mars has an axial tilt of 25.2 degrees, making it similar to Earth's tilt and resulting in seasons.",
                                    "Mars' gravity is 38% of Earth's gravity, so you would weigh much less on Mars.",
                                    "The first successful Mars rover was the 'Spirit Rover' in 2004.",
                                    "Mars is a rocky planet with a thin atmosphere made mostly of carbon dioxide (CO2).",
                                    "Mars has seasonal dust storms that can cover the entire planet.",
                                    "The atmosphere on Mars is 95% carbon dioxide.",
                                    "Mars has polar ice caps made of water and frozen carbon dioxide (dry ice).",
                                    "Mars has a very weak magnetic field.",
                                    "Mars was visited by the first rover in 1997, the 'Sojourner Rover'.",
                                    "Mars is named after the Roman god of war due to its red color resembling blood.",
                                    "The first successful landing on Mars was by NASA’s Viking 1 in 1976.",
                                    "Mars has an equatorial ridge called 'Tharsis', which is home to many large volcanoes.",
                                    "Mars is slightly more than half the size of Earth.",
                                    "Mars has no liquid water on its surface today, but there may be traces of ancient lakes and oceans.",
                                    "Mars’ atmosphere is very thin, so humans cannot survive on the surface without spacesuits.",
                                    "The largest impact crater on Mars is the Hellas Planitia, which is 2,300 km in diameter.",
                                    "Mars has a highly elliptical orbit, meaning its distance from the Sun varies significantly.",
                                    "In the 1960s, the Soviet Union and NASA started sending probes to Mars.",
                                    "Mars has a reddish sky during the day due to the fine dust particles in the atmosphere.",
                                    "The Martian year is almost twice as long as an Earth year, lasting 687 Earth days."
                                 ])
        case .jupiter:
            return PlanetDetails(name: "Jupiter", imageName: "Jupiter", description: "Jupiter has the shortest day of all the planets",
                                 numberOfMoons: 79, orbitPeriod: 4333, diameter: 142796, orbitNumber: 5, surfaceTemperate: -110,fileName: "Jupiter.usdz",facts: [
                                    "Jupiter is the largest planet in our solar system.",
                                    "Jupiter is a gas giant, meaning it has no solid surface.",
                                    "Jupiter has a diameter of about 86,881 miles (139,822 km).",
                                    "The Great Red Spot is a massive storm on Jupiter that has been raging for at least 400 years.",
                                    "Jupiter has 79 known moons, with Ganymede being the largest.",
                                    "Jupiter is made mostly of hydrogen and helium.",
                                    "A day on Jupiter lasts about 10 hours, making it the fastest rotating planet in the solar system.",
                                    "Jupiter’s magnetic field is the strongest of any planet in the solar system.",
                                    "Jupiter’s atmosphere is composed mainly of hydrogen, helium, and ammonia.",
                                    "The planet has faint rings, made of dust particles, that are hard to see.",
                                    "Jupiter’s gravity is about 2.5 times that of Earth, making it the most massive planet.",
                                    "The planet is so large that all the other planets in the solar system could fit inside it.",
                                    "Jupiter’s atmosphere contains clouds made of ammonia ice crystals.",
                                    "Jupiter has a very strong jet stream that causes fast winds.",
                                    "The gas giant has a strong magnetic field that traps radiation, creating radiation belts around the planet.",
                                    "Jupiter is the fifth planet from the Sun, with an orbit period of 11.86 Earth years.",
                                    "The planet has the most moons of any planet in the solar system, with 79 confirmed moons.",
                                    "Jupiter has a mass 318 times that of Earth.",
                                    "The composition of Jupiter is mostly hydrogen, helium, and traces of other gases.",
                                    "Jupiter's moon Io is the most geologically active body in the solar system, with hundreds of active volcanoes.",
                                    "Jupiter's cloud bands are made of gas and are powered by the planet's internal heat.",
                                    "Jupiter has a weak ring system, consisting of four faint rings made of dust particles.",
                                    "The magnetic field of Jupiter is 14 times stronger than Earth’s magnetic field.",
                                    "Jupiter's atmosphere is constantly churning with turbulent winds that can exceed 400 mph (640 km/h).",
                                    "Jupiter was the first planet to be visited by a spacecraft, Pioneer 10, in 1973.",
                                    "The planet's iconic red spot is shrinking and scientists are unsure why.",
                                    "Jupiter’s gravity is so strong it prevents its moons from escaping, but it also traps asteroids and comets.",
                                    "Jupiter’s moon Europa is considered one of the most likely places in the solar system to find life.",
                                    "Jupiter’s surface temperature is -110°C, though it doesn’t have a solid surface.",
                                    "Jupiter’s intense gravity has helped shield Earth from many comets and asteroids."
                                 ])
        case .saturn:
            return PlanetDetails(name: "Saturn", imageName: "Saturn", description: "Saturn has the most extensive rings of any planet",
                                 numberOfMoons: 82, orbitPeriod: 10759, diameter: 120660, orbitNumber: 6, surfaceTemperate: -140,fileName: "Saturn.usdz",facts: [
                                    "Saturn is the second largest planet in our solar system, after Jupiter.",
                                    "Saturn is a gas giant with no solid surface.",
                                    "Saturn's rings are made of ice and rock particles ranging in size from tiny grains to large boulders.",
                                    "Saturn has 82 moons, including Titan, its largest moon, which is larger than the planet Mercury.",
                                    "The Great White Spot is a massive storm on Saturn that occurs roughly every 30 Earth years.",
                                    "Saturn has an average diameter of 74,900 miles (120,536 km).",
                                    "A day on Saturn is only about 10 hours and 33 minutes long, making it one of the fastest rotating planets.",
                                    "Saturn’s gravity is about 1.07 times that of Earth.",
                                    "Saturn is primarily composed of hydrogen and helium.",
                                    "Saturn’s atmosphere has bands of clouds, similar to Jupiter, but they are less distinct.",
                                    "The winds on Saturn can reach speeds of up to 1,800 kilometers per hour (1,100 miles per hour).",
                                    "Saturn’s rings are the most prominent and well-known in the solar system.",
                                    "Saturn is the least dense of all the planets; it could float in water if there were a body of water large enough.",
                                    "Saturn’s magnetic field is weaker than Jupiter's but still much stronger than Earth’s.",
                                    "Saturn has a tilt of 26.7 degrees, giving it similar seasons to Earth.",
                                    "Saturn was visited by NASA's Cassini spacecraft, which orbited the planet for over 13 years.",
                                    "Saturn's rings are divided into seven major rings, each with its own distinct characteristics.",
                                    "Saturn’s largest moon, Titan, has lakes and rivers of liquid methane and is the only moon in the solar system with a thick atmosphere.",
                                    "Saturn's moon Enceladus has geysers that shoot water into space from beneath its icy surface.",
                                    "Saturn's rings are believed to be remnants of a moon or comet that was torn apart by the planet’s gravity.",
                                    "Saturn has been known since ancient times, with early astronomers using telescopes to observe its rings.",
                                    "The distance between Saturn and the Sun is about 1.4 billion kilometers (870 million miles).",
                                    "Saturn's atmosphere consists mainly of hydrogen and helium, with trace amounts of methane, ammonia, and water vapor.",
                                    "Saturn's moon Titan is the only moon in the solar system with a substantial atmosphere.",
                                    "Saturn is named after the Roman god of agriculture, father of Jupiter.",
                                    "Saturn’s moons have unique features: some are icy, others rocky, and some have unusual surface patterns.",
                                    "Saturn has a strong aurora at its poles, caused by its magnetic field interacting with solar wind.",
                                    "Saturn is the sixth planet from the Sun and has been studied extensively by space probes such as Voyager and Cassini.",
                                    "Saturn is a fascinating planet with many mysteries, and scientists continue to study it to learn more about its complex system."
                                 ])
        case .uranus:
            return PlanetDetails(name: "Uranus", imageName: "Uranus", description: "Uranus makes one trip around the Sun every 84 Earth years",
                                 numberOfMoons: 27, orbitPeriod: 30687, diameter: 51118, orbitNumber: 7, surfaceTemperate: -195,fileName: "Uranus.usdz",facts: [
                                    "Uranus is the coldest planet in the solar system, with temperatures as low as -224°C.",
                                    "Uranus is the seventh planet from the Sun.",
                                    "Uranus is unique because it rotates on its side, unlike any other planet in our solar system.",
                                    "Uranus has 27 known moons, the largest of which is Titania.",
                                    "The planet is made mostly of water, ammonia, and methane, with a small rocky core.",
                                    "Uranus was discovered by astronomer William Herschel in 1781.",
                                    "The planet’s atmosphere is composed of hydrogen, helium, and methane, which gives it a blue-green color.",
                                    "Uranus has a very weak magnetic field that is tilted at an angle of 59° to the planet’s axis of rotation.",
                                    "A year on Uranus lasts 84 Earth years, and a day on Uranus lasts 17.24 hours.",
                                    "Uranus’ axial tilt is about 98 degrees, which means it is tilted nearly parallel to its orbit around the Sun.",
                                    "The first spacecraft to visit Uranus was Voyager 2 in 1986.",
                                    "Uranus has a faint ring system made up of 13 known rings.",
                                    "Uranus has a very low density, and is classified as an ice giant.",
                                    "The winds on Uranus can reach speeds of 900 km/h (560 mph).",
                                    "Uranus is the only planet that rotates in the opposite direction compared to most of the other planets in the solar system.",
                                    "The atmosphere of Uranus is primarily made of hydrogen, helium, and methane, but it also contains traces of water, ammonia, and hydrocarbons.",
                                    "Uranus’ moons are named after characters from the works of William Shakespeare and Alexander Pope.",
                                    "Uranus’ interior consists of a core of rock and ice, surrounded by a thick mantle of water, ammonia, and methane ice.",
                                    "Uranus has been called a “gas giant,” but it is technically classified as an “ice giant” due to its higher concentration of ice compared to Jupiter and Saturn.",
                                    "Uranus experiences extreme seasons due to its extreme axial tilt. Each pole has 42 years of sunlight followed by 42 years of darkness.",
                                    "Uranus’ moon Miranda has one of the most varied terrains in the solar system, with ridges, valleys, and canyons.",
                                    "Uranus has a very faint magnetic field that is not aligned with its rotational axis.",
                                    "Because of its distance from the Sun, Uranus takes about 84 Earth years to complete one orbit.",
                                    "Uranus is the third-largest planet by diameter in the solar system.",
                                    "Uranus has no significant storm systems like Jupiter or Saturn, but it has some cloud formations and wind patterns.",
                                    "The rings of Uranus are darker and more difficult to see than those of Saturn, making them harder to study.",
                                    "Uranus was the first planet discovered with a telescope.",
                                    "Unlike most planets, Uranus doesn’t have a noticeable weather system, but it does have cloud bands.",
                                    "Uranus was named after the Greek god of the sky, the father of Saturn."
                                 ])
        case .neptune:
            return PlanetDetails(name: "Neptune", imageName: "Neptune", description: "Neptune was the first planet located through mathematical calculations",
                                 numberOfMoons: 14, orbitPeriod: 60190, diameter: 49523, orbitNumber: 8, surfaceTemperate: -200,fileName: "Neptune.usdz",facts: [
                                    "Neptune is the eighth and farthest planet from the Sun.",
                                    "Neptune has 14 known moons, with Triton being the largest.",
                                    "The planet’s blue color comes from methane in its atmosphere, which absorbs red light and reflects blue.",
                                    "Neptune has the strongest winds in the solar system, with speeds reaching up to 2,100 km/h (1,300 mph).",
                                    "Neptune was discovered in 1846 by Johann Galle, based on predictions by mathematician Urbain Le Verrier.",
                                    "Neptune’s atmosphere is made up of hydrogen, helium, and methane, with trace amounts of water and ammonia.",
                                    "A year on Neptune lasts 165 Earth years, but a day on Neptune is only about 16 hours long.",
                                    "Neptune has a very cold surface temperature, around -214°C, making it one of the coldest planets in the solar system.",
                                    "Neptune is similar in size and composition to Uranus and is sometimes referred to as an 'ice giant'.",
                                    "The planet has a very dynamic weather system, with large storms, including the Great Dark Spot, similar to Jupiter’s Great Red Spot.",
                                    "Neptune has six rings, which are faint and made mostly of ice particles and dust.",
                                    "Neptune’s moon, Triton, is unique because it has a retrograde orbit, meaning it orbits in the opposite direction to the planet's rotation.",
                                    "Triton is the only large moon in the solar system with a retrograde orbit and is thought to have been captured by Neptune’s gravity.",
                                    "Neptune’s magnetic field is tilted at an angle of 47 degrees from its axis of rotation.",
                                    "The temperature on Neptune can drop as low as -218°C, making it one of the coldest planets in the solar system.",
                                    "Neptune's composition is primarily made of water, methane, and ammonia ices, along with a small rocky core.",
                                    "Neptune has a low density compared to other planets in the solar system.",
                                    "Neptune’s winds can move faster than the speed of sound on Earth.",
                                    "Neptune has been visited only once by a spacecraft, NASA’s Voyager 2, which flew by in 1989.",
                                    "Neptune’s atmosphere is very active, with changing cloud patterns and intense storms.",
                                    "Neptune has a faint set of rings that were discovered in 1984, although they are not as prominent as Saturn’s.",
                                    "The discovery of Neptune helped confirm the existence of gravitational interactions between planets in our solar system.",
                                    "Neptune was the first planet to be discovered through mathematical predictions rather than direct observation.",
                                    "Neptune’s interior is believed to consist of a dense core surrounded by water, ammonia, and methane ices, and a hydrogen-helium atmosphere.",
                                    "Neptune’s rotation period is not well known due to its lack of a solid surface to track.",
                                    "The planet has a very low surface pressure, making its atmosphere very thin at higher altitudes.",
                                    "Neptune is constantly losing heat to space, and its internal heat source is believed to be responsible for its active weather.",
                                    "The planet’s rings are not solid like Saturn’s; instead, they are made of icy particles and dust, making them faint and hard to observe.",
                                    "Neptune is one of the few planets in the solar system that has never been visited by a spacecraft since Voyager 2’s flyby."
                                 ])
        case .pluto:
            return PlanetDetails(name: "Pluto", imageName: "Pluto", description: "Pluto was reclassified from a planet to a dwarf planet in 2006",
                                 numberOfMoons: 5, orbitPeriod: 90560, diameter: 2300, orbitNumber: 9, surfaceTemperate: -225,fileName: "Pluto.usdz",facts: [
                                    "Pluto was once considered the ninth planet in the solar system before being reclassified as a dwarf planet in 2006.",
                                    "Pluto has five known moons: Charon, Styx, Nix, Kerberos, and Hydra.",
                                    "Pluto's largest moon, Charon, is so big that it is sometimes considered a double dwarf planet system with Pluto.",
                                    "Pluto is made mostly of ice and rock and has a thin atmosphere composed primarily of nitrogen, methane, and carbon monoxide.",
                                    "A day on Pluto lasts about 6.4 Earth days.",
                                    "Pluto’s orbit is highly elliptical and tilted, which means its distance from the Sun varies greatly.",
                                    "The surface temperature on Pluto is extremely cold, around -229°C (-380°F).",
                                    "Pluto's atmosphere expands and contracts as it orbits the Sun, becoming thicker when closer and thinner when farther away.",
                                    "Pluto has a very small core, about the size of the Moon, and a thick, icy mantle.",
                                    "The New Horizons spacecraft flew by Pluto in July 2015, providing the first close-up images and data of the dwarf planet.",
                                    "Pluto’s orbit brings it closer to the Sun than Neptune for a portion of its orbit, but the two never collide because of their gravitational resonance.",
                                    "Pluto’s orbit takes 248 Earth years to complete, making it one of the slowest-moving objects in the solar system.",
                                    "Despite its small size, Pluto has a complex geological history, with mountains made of water ice and vast plains of frozen nitrogen.",
                                    "Pluto has an average diameter of 2,376 kilometers, making it smaller than Earth's moon.",
                                    "Pluto's moon Charon is so large that it is tidally locked with Pluto, meaning both bodies always show the same face to each other.",
                                    "Pluto has not cleared its orbit of other objects, which is one of the criteria that led to its reclassification as a dwarf planet.",
                                    "In 2006, Pluto was reclassified as a dwarf planet by the International Astronomical Union (IAU) due to the discovery of other similar-sized objects in the Kuiper Belt.",
                                    "Pluto is located in the Kuiper Belt, a region of the solar system beyond Neptune filled with icy objects.",
                                    "Pluto is about 5.9 billion kilometers (3.7 billion miles) from the Sun at its farthest point in its orbit.",
                                    "Pluto's orbit is inclined at a steep angle of 17.1° relative to the plane of the solar system.",
                                    "Pluto was discovered by Clyde Tombaugh in 1930, and its status as a planet remained until 2006.",
                                    "The surface of Pluto features vast plains of frozen nitrogen, mountains made of water ice, and deep valleys.",
                                    "Pluto’s atmosphere is extremely thin and composed mostly of nitrogen, with small amounts of methane and carbon monoxide.",
                                    "The dwarf planet has an eccentric and tilted orbit that makes it travel inside Neptune's orbit for a short period of time during its 248-year orbit.",
                                    "Pluto’s five moons are thought to have formed from debris resulting from a collision with a large object early in the history of the solar system.",
                                    "Pluto has no rings, but some scientists speculate that it may have had rings in the past, now destroyed by impacts.",
                                    "Pluto’s surface is not only cold but is also one of the most geologically diverse places in the solar system, with icy mountains and vast plains.",
                                    "The New Horizons mission captured stunning images of Pluto's heart-shaped region, known as the Tombaugh Regio, in 2015.",
                                    "Pluto is named after the Roman god of the underworld, a fitting name given its remote and cold nature."
                                 ])
        }
    }
}

