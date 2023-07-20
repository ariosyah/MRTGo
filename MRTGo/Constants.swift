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
                Instruction(dataTitle: "Keluar Kereta 1", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Image1")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "20 Meter", dataImage: Image("Image2")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Image3")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "10 Meter", dataImage: Image("Image4"))
                // Add more instructions here as needed
            ]),
            AttractionList(name: "Exit A", nearbyAttractions: ["Plaza Indonesia, Hotel Indonesia Kempinski, Grand Indonesia, Monumen Selamat Datang"], instructions: [
                Instruction(dataTitle: "Keluar Kereta 1", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Image1")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "20 Meter", dataImage: Image("Image2")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Image3")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "10 Meter", dataImage: Image("Image4"))
                // Add more instructions here as needed
            ])
            // Add more attraction lists here as needed
        ]
}
