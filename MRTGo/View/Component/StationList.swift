//
//  StationList.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//
import SwiftUI

struct Station {
    var name: String
    var exitCount: Int
    var location: (latitude: Double, longitude: Double)
    var stopList: [String]
}

struct StationList: View {
    
    @Binding var departure: String
    @Binding var isDepartureChosen: Bool
    @Environment(\.colorScheme) var colorScheme

    
    // Function to filter stations based on the search text
    private func filteredStations() -> [Station] {
        return matchedStations(stations: nameList.stations, departure: departure, isDepartureChosen: isDepartureChosen)
       }
    
    //    var matchedStations: [Station] {
//        return stations.filter { $0.name.lowercased().contains(departure.lowercased()) }
//    }
//
//    private func filteredStations() -> [Station] {
//        if departure.isEmpty {
//            return stations
//        } else {
//            return matchedStations
//        }
//    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pilih Stasiun Keberangkatan")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("Primary"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

            ScrollView {
                VStack {
                    ForEach(filteredStations(), id: \.name) { station in
                        Button(action: {
                            departure = station.name // Set the departure state to the selected station's name
                            isDepartureChosen = true

                        }) {
                            HStack(spacing: 10) {
                                Image("train")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(station.name)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(colorScheme == .light ? .black : .white)
                                    Text("\(station.exitCount) Exit")
                                        .font(.system(size: 16, weight: .medium))
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
            }
        }
    }
}


//struct StationList_Previews: PreviewProvider {
//    static var previews: some View {
//        StationList()
//    }
//}

//struct StationList: View {
//    @Binding var departure: String
//    let stations = [
//        Station(name: "Stasiun Lebak Bulus", exitCount: 3),
//        Station(name: "Stasiun Bundaran Hi", exitCount: 4),
//    ]
//
//    var body: some View {
//        VStack {
//            ForEach(stations, id: \.name) { station in
//                Button(action: {
//                    departure = station.name // Set the departure state to the selected station's name
//                }) {
//                    HStack(spacing: 10) {
//                        Image("train")
//                            .resizable()
//                            .frame(width: 24, height: 24)
//                        VStack(alignment: .leading, spacing: 2) {
//                            Text(station.name)
//                                .font(.system(size: 16, weight: .medium))
//                            Text("\(station.exitCount) Exit")
//                                .font(.system(size: 16, weight: .medium))
//                                .foregroundColor(Color("Gray-400"))
//                        }
//                        Spacer()
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 5)
//                    .frame(maxWidth: .infinity)
//                }
//            }
//        }
//        .padding()
//    }
//}
