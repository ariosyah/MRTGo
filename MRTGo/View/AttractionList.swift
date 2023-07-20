//
//  AttractionList.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import Foundation
import SwiftUI

struct AttractionList: Identifiable {
    var id: UUID = UUID()
    var name: String
    var nearbyAttractions: [String]
    var instructions: [Instruction]
}

struct Instruction: Identifiable {
    var id: UUID = UUID()
    var dataTitle: String
    var dataSubtitle: String
    var dataImage: Image
}


