//
//  StationItem.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

struct StationItem: View {
//    @Binding var departure: String
//    @Binding var isDepartureChosen: Bool
    @State var name: String
    @State var exit: Int
    
    var body: some View {
        Button(action: {
//            departure = station.name // Set the departure state to the selected station's name
//            isDepartureChosen = true
            
        }) {
            HStack(spacing: 10) {
                Image("train")
                    .resizable()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("Gray-950"))
                    Text("\(exit) Exit")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color("Gray-400"))
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity)
        }
    }
}

struct StationItem_Previews: PreviewProvider {
    static var previews: some View {
        StationItem(name: "Stasiun Lebak Bulus", exit: 4)
    }
}
