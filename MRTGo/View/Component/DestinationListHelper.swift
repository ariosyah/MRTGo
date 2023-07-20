//
//  DestinationListHelper.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import Foundation

func matchedDestination(destinationPlace: [Destination], destination: String) -> [Destination] {
    if destination.isEmpty {
        return destinationPlace
    } else {
        return destinationPlace.filter { $0.name.lowercased().contains(destination.lowercased()) }
    }
}

let destinationPlace = [
    Destination(name: "Hotel Pullman Jakarta", exitGate: "Stasiun Bundaran HI (Exit 1A)"),
    Destination(name: "testdata", exitGate: "Stasiun Bundaran HI (Exit 1A)")
]
