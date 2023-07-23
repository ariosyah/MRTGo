//
//  StationListHelper.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import Foundation

//func matchedStations(stations: [Station], departure: String) -> [Station] {
//    if departure.isEmpty {
//        return stations
//    } else {
//        return stations.filter { $0.name.lowercased().contains(departure.lowercased()) }
//    }
//}

func matchedStations(stations: [Station], departure: String, isDepartureChosen: Bool) -> [Station] {
    var matchedStation: [Station] = []
    if departure.isEmpty {
        matchedStation = stations
    } else if !isDepartureChosen {
        matchedStation = stations.filter { $0.name.lowercased().contains(departure.lowercased()) }
    }
    return matchedStation
}

class nameList {
    init() {
        
    }
    
    static let stations = [
        Station(name: "Stasiun Lebak Bulus Grab", exitCount: 6,location: (-6.2894231,106.7740072),stopList: ["Stasiun Fatmawati Indomaret", "Stasiun Cipete Raya", "Stasiun Haji Nawi", "Stasiun Blok A", "Stasiun ASEAN", "Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 340),
        Station(name: "Stasiun Fatmawati Indomaret", exitCount: 4, location :(-6.292183388653702, 106.79243853811707),stopList: ["Stasiun Cipete Raya", "Stasiun Haji Nawi", "Stasiun Blok A", "Stasiun ASEAN", "Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 310),
        Station(name: "Stasiun Cipete Raya", exitCount: 6, location:(-6.276588818221201, 106.79741744823758),stopList: ["Stasiun Haji Nawi", "Stasiun Blok A", "Stasiun ASEAN", "Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 272),
        Station(name: "Stasiun Haji Nawi", exitCount: 5,location: (-6.265586650585927, 106.79732672366144),stopList: ["Stasiun Blok A", "Stasiun ASEAN", "Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 248),
        Station(name: "Stasiun Blok A", exitCount: 4,location: (-6.254419041075844, 106.79759819972722),stopList: ["Stasiun ASEAN", "Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 224),
        Station(name: "Stasiun ASEAN", exitCount: 3,location: (-6.236947192974451, 106.79924619401889),stopList: ["Stasiun Senayan", "Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 196),
        Station(name: "Stasiun Senayan", exitCount: 4,location: (-6.226109503011379, 106.8027371496656),stopList: ["Stasiun Istora Mandiri", "Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 160),
        Station(name: "Stasiun Istora Mandiri", exitCount: 4,location: (-6.222106818596701, 106.80853485161028),stopList: ["Stasiun Bendungan Hilir", "Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 100),
        Station(name: "Stasiun Bendungan Hilir", exitCount: 3,location: (-6.214691536452079, 106.81788843992139),stopList: ["Stasiun Setiabudi Astra","Stasiun Dukuh Atas BNI"],disclosureSize: 100),
        Station(name: "Stasiun Setiabudi Astra", exitCount: 4,location: (-6.208695951383127, 106.82149455905058),stopList: ["Stasiun Dukuh Atas BNI"],disclosureSize: 100),
        Station(name: "Stasiun Dukuh Atas BNI", exitCount: 5,location: (-6.2004878727534924, 106.82283168730487),stopList: [""],disclosureSize: 10),
        Station(name: "Stasiun Bundaran HI", exitCount: 6, location: (6.19117289,106.8230024),stopList: [""],disclosureSize: 10),
    ]
}

