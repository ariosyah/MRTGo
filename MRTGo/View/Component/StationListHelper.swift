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
    Station(name: "Stasiun Lebak Bulus Grab", exitCount: 6,location: (-6.2894231,106.7740072)),
//    Station(name: "Stasiun Fatmawati Indomaret", exitCount: 4),
//    Station(name: "Stasiun Cipete Raya", exitCount: 6),
//    Station(name: "Stasiun Haji Nawi", exitCount: 5),
//    Station(name: "Stasiun Blok A", exitCount: 4),
//    Station(name: "Stasiun ASEAN", exitCount: 3),
//    Station(name: "Stasiun Senayan", exitCount: 4),
//    Station(name: "Stasiun Istora Mandiri", exitCount: 4),
//    Station(name: "Stasiun Bendungan Hilir", exitCount: 3),
//    Station(name: "Stasiun Setiabudi Astra", exitCount: 4),
//    Station(name: "Stasiun Dukuh Atas BNI", exitCount: 5),
    Station(name: "Stasiun Bundaran Hi", exitCount: 6, location: (6.19117289,106.8230024)),
]
