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
            AttractionList(name: "Exit 1 (Pintu A)", nearbyAttractions: ["Plaza Indonesia", "Hotel Indonesia Kempinski", "Grand Indonesia", "Monumen Selamat Datang"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "5 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kanan", dataSubtitle: "1 Menit", dataImage: Image("Belok Kanan")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "3 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kanan", dataSubtitle: "1 Menit", dataImage: Image("Belok Kanan")),
                Instruction(dataTitle: "Jalan menuju Tangga/Eskalator", dataSubtitle: "2 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ]),
            // Add more attraction lists here as needed
            AttractionList(name: "Exit 2 (Pintu B)", nearbyAttractions: ["Gedung Indonesia One", "Kedubes Jepang", "Lippo Thamrin", "Hotel Four Season Points Thamrin"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Starbucks", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri menuju Tangga/Eskalator", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ]),
            AttractionList(name: "Exit 3 (Pintu C)", nearbyAttractions: ["Halte Transjakarta"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "5 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kanan", dataSubtitle: "1 Menit", dataImage: Image("Belok Kanan")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "3 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Tangga", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ]),
            AttractionList(name: "Exit 4 (Pintu D)", nearbyAttractions: ["Plaza Bank Index", "Hotel Pullman Jakarta", "Wisma Nusantara", "Kantor PT MRT Jakarta", "Bundaran HI", "Jalan Sultan Syahrir", "Polsubsektor Thamrin", "Deutsche Bank", "Jalan Imam Bonjol"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "5 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "2 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kanan", dataSubtitle: "1 Menit", dataImage: Image("Belok Kanan")),
                Instruction(dataTitle: "Jalan menuju Eskalator", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ]),
            AttractionList(name: "Exit 5 (Pintu E)", nearbyAttractions: ["Jalan MH Thamrin", "Pertamina Lubricants"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Alfa Express", dataSubtitle: "5 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Ujung Lorong", dataSubtitle: "2 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kiri", dataSubtitle: "1 Menit", dataImage: Image("Belok Kiri")),
                Instruction(dataTitle: "Jalan menuju Tangga", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ]),
            AttractionList(name: "Exit 6 (Pintu F)", nearbyAttractions: ["Sinarmas", "Institut Francais Indonesia", "Kedutaan Besar Perancis", "Jalan Sunda", "Sarinah", "Jalan KH Wahid Hasyim"], instructions: [
                Instruction(dataTitle: "Keluar Kereta", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Keluar Kereta")),
                Instruction(dataTitle: "Naik Tangga", dataSubtitle: "3 Menit", dataImage: Image("Naik Tangga")),
                Instruction(dataTitle: "Tap Out", dataSubtitle: "Stasiun Bundaran HI", dataImage: Image("Tap Out")),
                Instruction(dataTitle: "Jalan menuju Starbucks", dataSubtitle: "1 Menit", dataImage: Image("Jalan Menuju")),
                Instruction(dataTitle: "Belok Kanan menuju Tangga", dataSubtitle: "1 Menit", dataImage: Image("Belok Kanan")),
                Instruction(dataTitle: "Keluar Stasiun", dataSubtitle: "3 Menit", dataImage: Image("Keluar Stasiun"))
            ])
        ]
}
