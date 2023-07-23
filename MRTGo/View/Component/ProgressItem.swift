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
    @State private var onBasedLocation = false
    @State private var onTargetLocation = false
    @State private var onDestinationLocation = false
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
                        if onBasedLocation == true {
                            StripLine(color: Color("Secondary"), width: 4, height: revealDetails ? 320 : 36)
                        }
                        else{
                            StepperDash(height: revealDetails ? 320 : 40, width: 4,color: Color("Secondary"))
                        }
                        
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
                            .foregroundColor(onTargetLocation ? Color("Secondary") : Color("Card-Outline"))
                            .overlay(
                                Circle()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(Color(uiColor:.systemBackground))
                            )
                        if onDestinationLocation == true {
                            StripLine(color: Color("Secondary"), width: 4, height: 40)
                        }
                        else if onTargetLocation == true {
                            StepperDash(height: 40, width: 4,color: Color("Secondary"))
                        }
                        else {
                            StepperDash(height: 40, width: 4,color: Color("Card-Outline"))
                        }

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
                            .foregroundColor(onDestinationLocation ? Color("Secondary"):Color("Card-Outline"))
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


struct DashedVerticalLine: Shape {
    let width: CGFloat
    let dashHeight: CGFloat
    let dashSpacing: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let x = rect.origin.x + (rect.size.width - width) / 2
        var y = rect.origin.y

        while y < rect.size.height {
            let endY = y + dashHeight
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: x, y: endY))
            y += dashHeight + dashSpacing
        }

        return path
    }
}

struct StepperDash: View {
    var height: CGFloat
    var width: CGFloat
    var color: Color
    
    var body: some View {
        DashedVerticalLine(width: 0, dashHeight: 6, dashSpacing: 6)
            .stroke(style: StrokeStyle(lineWidth: 4, dash: [6, 6]))
            .frame(width: width,height: height)
            .foregroundColor(color)
    }
}

struct ProgressItem_Previews: PreviewProvider {
    static var previews: some View {
        ProgressItem(destination: .constant("Hotel Pullman Jakarta"),departure: .constant("Stasiun Lebak Bulus"))
    }
}
