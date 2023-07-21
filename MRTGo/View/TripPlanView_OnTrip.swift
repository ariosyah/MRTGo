//
//  TripPlanView_OnTrip.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import SwiftUI

struct TripPlanView_OnTrip: View {
    @Binding var isKeyboardActive : Bool
    @Binding var departure : String
    @Binding var destination : String
    @Binding var isDepartureChosen : Bool
    @Binding var isDestinationChosen : Bool
    @State private var isShowingNavigation = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                VStack(alignment: .leading){
                    // Header
                    Header(departure: $departure, destination: $destination, isDepartureChosen: $isDepartureChosen, isDestinationChosen: $isDestinationChosen) // Pass isDepartureChosen as a binding
                        .frame(width: geometry.size.width, height: 200)
                    
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
                    ProgressItem(destination: $destination)
                        .padding(.horizontal,24)
                        .frame(height: .infinity)
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
                            Text("Exit (Pintu A)")
                                .font(Font.custom("HelveticaNeue",size:18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("Primary"))
                            
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
}

struct TripPlanView_OnTrip_Previews: PreviewProvider {
    static var previews: some View {
        TripPlanView_OnTrip(isKeyboardActive: .constant(true), departure: .constant(""), destination: .constant("Hotel Pullman Jakarta"), isDepartureChosen: .constant(false), isDestinationChosen: .constant(false))
    }
}
