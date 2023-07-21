//
//  StationItemHelper.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import Foundation

struct StationItemData {
    var name: String
    var exit: Int
}

func matchedStationsDestination(stations: [StationItemData], stationName: String) -> [StationItemData] {
    if stationName.isEmpty {
        return stations
    } else {
        return stations.filter { $0.name.lowercased().contains(stationName.lowercased()) }
    }
}

let stationItemDataArray = [
    StationItemData(name: "Stasiun Bundaran HI", exit: 4),
    StationItemData(name: "Stasiun Fatmawati Indomaret", exit: 4),
    StationItemData(name: "Stasiun Cipete Raya", exit: 5)
    
]
