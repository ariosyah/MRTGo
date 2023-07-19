//
//  StationListHelper.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import Foundation

func matchedStations(stations: [Station], departure: String) -> [Station] {
    if departure.isEmpty {
        return stations
    } else {
        return stations.filter { $0.name.lowercased().contains(departure.lowercased()) }
    }
}

let stations = [
    Station(name: "Stasiun Lebak Bulus", exitCount: 3),
    Station(name: "Stasiun Bundaran Hi", exitCount: 4),
]
