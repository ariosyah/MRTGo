//
//  DestinationListHelper.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import Foundation

//func matchedDestination(destinationPlace: [Destination], destination: String) -> [Destination] {
//    if destination.isEmpty {
//        return destinationPlace
//    } else {
//        return destinationPlace.filter { $0.name.lowercased().contains(destination.lowercased()) }
//    }
//}

func matchedDestination(destinationPlace: [Destination], destination: String, isDestinationChosen: Bool) -> [Destination] {
    var matchedDestination: [Destination] = []
    if destination.isEmpty {
        matchedDestination = destinationPlace
    } else if !isDestinationChosen {
        matchedDestination = destinationPlace.filter { $0.name.lowercased().contains(destination.lowercased()) }
    }
    return matchedDestination
}

//let destinationPlace = [
//    Destination(name: "Hotel Pullman Jakarta", exitGate: "Stasiun Bundaran HI (Exit 1A)", location: (-6.1931170,106.8237489)),
////    Destination(name: "testdata", exitGate: "Stasiun Bundaran HI (Exit 1A)")
//]

let destinationPlace = [
    // Pintu A, 5 First Provided Location
    Destination(name: "Plaza Indonesia", exitGate: "Stasiun Bundaran HI (Exit 1 - Pintu A)", location: (-6.193570566404313, 106.82194737519785)),
    Destination(name: "Hotel Indonesia Kempinski", exitGate: "Stasiun Bundaran HI (Exit 1 - Pintu A)", location: (-6.195314240905304, 106.82232500903086)),
    Destination(name: "Grand Indonesia", exitGate: "Stasiun Bundaran HI (Exit 1 - Pintu A)", location: (-6.194843875582314, 106.82095516686233)),
    Destination(name: "Bundaran HI", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)", location: (-6.195081142046306, 106.823019743916)),
    Destination(name: "Hotel Pullman Jakarta", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)", location: (-6.1931170, 106.8237489)),
//    Destination(name: "Monumen Selamat Datang", exitGate: "Stasiun Bundaran HI (Exit 1 - Pintu A)")
//    // Pintu B
//    Destination(name: "Gedung Indonesia One", exitGate: "Stasiun Bundaran HI (Exit 2 - Pintu B)"),
//    Destination(name: "Kedubes Jepang", exitGate: "Stasiun Bundaran HI (Exit 2 - Pintu B)"),
//    Destination(name: "Lippo Thamrin", exitGate: "Stasiun Bundaran HI (Exit 2 - Pintu B)"),
//    Destination(name: "Hotel Four Season Points Thamrin", exitGate: "Stasiun Bundaran HI (Exit 2 - Pintu B)"),
//    // Pintu C
//    Destination(name: "Halte Transjakarta", exitGate: "Stasiun Bundaran HI (Exit 3 - Pintu C)"),
//    // Pintu D
//    Destination(name: "Plaza Bank Index", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Wisma Nusantara", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Kantor PT MRT Jakarta", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Jalan Sultan Syahrir", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Polsubsektor Thamrin", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Deutsche Bank", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    Destination(name: "Jalan Imam Bonjol", exitGate: "Stasiun Bundaran HI (Exit 4 - Pintu D)"),
//    // Pintu E
//    Destination(name: "Jalan MH Thamrin", exitGate: "Stasiun Bundaran HI (Exit 5 - Pintu E)"),
//    Destination(name: "Pertamina Lubricants", exitGate: "Stasiun Bundaran HI (Exit 5 - Pintu E)"),
//    // Pintu F
//    Destination(name: "Sinarmas", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)"),
//    Destination(name: "Institut Francais Indonesia", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)"),
//    Destination(name: "Kedutaan Besar Perancis", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)"),
//    Destination(name: "Jalan Sunda", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)"),
//    Destination(name: "Sarinah", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)"),
//    Destination(name: "Jalan KH Wahid Hasyim", exitGate: "Stasiun Bundaran HI (Exit 6 - Pintu F)")
]
