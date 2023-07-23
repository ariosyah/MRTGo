//
//  HeaderExploration.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

struct HeaderExploration: View {
//    @State private var chooseStation: String = ""
    @State private var chooseStation = ""
    @State private var stationName = ""
    @State private var isStationChosen = false
    
    var body: some View {
        ZStack {
            // Blue Header
            Rectangle()
                .foregroundColor(Color("Primary"))
                .ignoresSafeArea(.all)
                .frame(width: 400, height: 160)
            
            // Textfield
            VStack {
                Text("Jelajahi destinasi")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                
                // Departure Textfield
                ZStack(alignment: .leading) {
                        Image("train")
                            .resizable()
                            .frame(width: 24, height: 24)
                        
                        if isStationChosen {
                            Text("") // Show the departure name when it's chosen
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color("Primary"))
                                .padding(.leading, 40)
                        } else if stationName.isEmpty {
                            Text("Pilih Tujuan")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color("Primary"))
                                .padding(.leading, 40)
                        }

                        TextField("", text: $stationName)
                            .padding(.leading, 40)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("Primary"))

                        
                        //TextField
                        TextField("", text: $stationName)
                            .padding(.leading, 40)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("Primary"))

                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .onChange(of: stationName) { newValue in
                    // Check if the entered text matches any station
                    isStationChosen = matchedStationsDestination(stations: stationItemDataArray, stationName: stationName).isEmpty
                }
            }
            .padding(.bottom, 40)
        }
    }
}

struct HeaderExploration_Previews: PreviewProvider {
    static var previews: some View {
        HeaderExploration()
    }
}
