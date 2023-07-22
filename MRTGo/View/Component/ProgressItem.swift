//
//  ProgressItem.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import SwiftUI

struct ProgressItem: View {
    @Binding var destination : String
    @Binding var departure : String
    @State private var revealDetails = false
    private let stations = ["Stasiun Fatmawati", "Stasiun Cipete Raya", "Stasiun Haji Nawi", "Stasiun Haji Blok A", "Stasiun Haji Blok M", "Stasiun Sisimangraja", "Stasiun Senayan", "Stasiun Istora", "Stasiun Benhil", "Stasiun Setiabudi"]
    var body: some View {
        List{
            //Based Station
            VStack(alignment: .leading,spacing: 0){
                HStack(spacing:16) {
                    VStack(spacing:0){
                        Circle()
                            .frame(width: 36,height: 36)
                            .foregroundColor(Color("Secondary"))
                            .overlay(
                                Circle()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color(uiColor:.systemBackground))
                            )
                        StripLine(color: Color("Secondary"), width: 4, height: revealDetails ? 320 : 36)
                    }
                    
                    VStack(alignment:.leading,spacing: 0){
                        HStack{
                            //Define location name
                            Text("\(departure)")
                                .font(Font.custom("HelveticaNeue", size: 16))
                                .foregroundColor(.black)
                                .bold()
                            Image("marker-pin-departure")
                                .resizable()
                                .frame(width: 24,height: 24)
                        }
                        DisclosureGroup("11 Perhentian", isExpanded: $revealDetails) {
                            VStack(alignment: .leading,spacing: 10){
                                ForEach(stations, id: \.self) { station in
                                    Text(station)
                                        .font(Font.custom("HelveticaNeue", size: 16))
                                        .foregroundColor(Color("Gray-400"))
                                }
                            }
                        }
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .foregroundColor(revealDetails ? Color(.black) : Color("Gray-500"))
                        .frame(width: 150)
                        .padding(.top,10)
                        .accentColor(revealDetails ? Color(.black) : Color("Gray-500"))
                        Spacer()
                    }
                }
                .animation(nil, value: UUID())
                //Target Station
                HStack(spacing:16) {
                    VStack(spacing:0){
                        Circle()
                            .frame(width: 36,height: 36)
                            .foregroundColor(Color("Secondary"))
                            .overlay(
                                Circle()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color(uiColor:.systemBackground))
                            )
                        StripLine(color: Color("Secondary"), width: 4, height: 36)
                    }
                    VStack(alignment:.leading,spacing: 4){
                        HStack{
                            //Define location name
                            Text("Stasiun Bundaran HI")
                                .font(Font.custom("HelveticaNeue", size: 16))
                                .foregroundColor(.black)
                                .bold()
                        }
                        if let attractionList = Constants.attractions.first(where: { $0.nearbyAttractions.contains(where: { $0.lowercased() == destination.lowercased() }) }) {
                            Text("Menuju \(attractionList.name)")
                                .font(Font.custom("HelveticaNeue", size: 16))
                                .foregroundColor(Color("Primary"))
                                .fontWeight(.medium)
                        }
                        else {
                            Text("Menuju Surga")
                                .font(Font.custom("HelveticaNeue", size: 16))
                                .foregroundColor(Color("Primary"))
                                .fontWeight(.medium)
                        }
                        
                        Spacer()
                    }
                }
                .animation(nil, value: UUID())
                //Destination Target
                HStack(spacing:16) {
                    VStack(spacing:0){
                        Circle()
                            .frame(width: 36,height: 36)
                            .foregroundColor(Color("Secondary"))
                            .overlay(
                                Circle()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color(uiColor:.systemBackground))
                            )
                        Spacer()
                    }
                    VStack(alignment:.leading,spacing: 0){
                        HStack{
                            //Define location name
                            Text("\(destination)")
                                .font(Font.custom("HelveticaNeue", size: 16))
                                .foregroundColor(.black)
                                .bold()
                            Image("marker-pin-destination")
                                .resizable()
                                .frame(width: 24,height: 24)
                        }
                        Spacer()
                        
                    }
                    .padding(.vertical,4)
                }
                .animation(nil, value: UUID())
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}

struct StripLine: View {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width,height: height)
    }
}

struct ProgressItem_Previews: PreviewProvider {
    static var previews: some View {
        ProgressItem(destination: .constant("Hotel Pullman Jakarta"),departure: .constant("Stasiun Lebak Bulus"))
    }
}
