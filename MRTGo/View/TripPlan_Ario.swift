//
//  TripPlan_Ario.swift
//  MRTGo
//
//  Created by Ario Syahputra on 20/07/23.
//

import SwiftUI

struct TripPlan_Ario: View {
    @State private var isShowingNavigation = false
    @Binding var departure : String
    @Binding var destination : String
    let stations: [Station]

    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                
                // Trip Plan
                HStack{
                    Text("Detail Perjalanan")
                        .font(Font.custom("HelveticaNeue", size: 24))
                        .foregroundColor(Color("Primary"))
                        .bold()
                    Spacer()
                }
                .padding(24)
                
                //Progress Item
                ProgressItem(destination: $destination,departure: $departure,stations: nameList.stations)
                Spacer()
            }
            Button(action: {
                //provide action
                isShowingNavigation.toggle()
            }) {
                
                Text("Navigasi Exit")
                    .font(Font.custom("HelveticaNeue",size:16))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 342, height: 56)
                    .background(Color("Primary"))
                    .cornerRadius(200)
            }
            .padding(.top, 30)
        }
        .sheet(isPresented: $isShowingNavigation) {
            VStack(alignment: .leading,spacing: 16){
                HStack{
                    VStack(alignment: .leading){
                        if let attractionList = Constants.attractions.first(where: { $0.nearbyAttractions.contains(where: { $0.lowercased() == destination.lowercased() }) }) {
                            Text(attractionList.name)
                                .font(Font.custom("HelveticaNeue", size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary"))
                        } else {
                            // Handle the case when there is no relevant attraction list for the given destination
                            Text("Unknown Exit")
                                .font(Font.custom("HelveticaNeue", size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary"))
                        }
                        
                        Text("Stasiun Bundaran HI")
                            .font(Font.custom("HelveticaNeue",size:16))
                            .foregroundColor(Color("Gray-500"))
                    }
                    Spacer()
                }
                .padding(.top,16)
                ScrollView{
                    VStack(alignment: .leading,spacing:12){
                        ForEach(((Constants.attractions.first(where: {$0.nearbyAttractions.contains(where: {$0.lowercased() == destination.lowercased()})})?.instructions)!)) { instruction in
                            NavigationStep(instruction: instruction)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.top,16)
            .padding(.horizontal,24)
            .presentationDetents([.height(433)])
            .presentationDragIndicator(.visible)
            
        }
    }
}
