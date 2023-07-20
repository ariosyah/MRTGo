//
//  Constants.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import Foundation
import SwiftUI
class Constants {
    init() {
        
    }
    
    static let attractions: [AttractionList] = [
            AttractionList(name: "Exit A", nearbyAttractions: ["Plaza Indonesia", "Hotel Indonesia Kempinski", "Grand Indonesia", "Monumen Selamat Datang","Hotel Pullman Jakarta"], instructions: [
                Instruction(dataTitle: "Keluar Kereta 1", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "20 Meter", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "10 Meter", dataImage: Image("Jalan Menuju"))
                // Add more instructions here as needed
            ])
            // Add more attraction lists here as needed
        ]
}
