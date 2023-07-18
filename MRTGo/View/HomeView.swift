//
//  HomeView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 18/07/23.
//

import SwiftUI

struct HomeView: View {
    
    let homeItems = [
            ("tiket", "Tiket"),
            ("jadwal", "Jadwal"),
            ("kartuku", "Kartuku"),
            ("tripplan", "Trip Plan"),
            ("more", "More")
        ]

    
    var body: some View {
        
        VStack{
            
            // Blue Header
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Primary"))
                    .ignoresSafeArea(.all)
                    .frame(width: 400, height: 270)
                
                //Header Title
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Halo, **Bang Joni!**")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.white)
                            HStack{
                                Image("marker-pin")
                                    .frame(width: 16, height: 16)
                                Text("13 km | Stasiun Lebak Bulus Grab ")
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(.white)
                            }

                        }
                        
                        Spacer()
                        
                        Image("profile")
                        .frame(width: 48, height: 48)
                    }
                    .padding(.horizontal, 30)
                    
                    //Container
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .ignoresSafeArea(.all)
                            .frame(width: 358, height: 130)
                            .cornerRadius(8)
                        
                        VStack{
                            HStack{
                                HStack{
                                    Image("medal")
                                        .frame(width: 16, height: 16)
                                    Text("Kamu punya 0 pts")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                .padding(5)
                                .padding(.horizontal, 8)
                                .background(Color("Secondary"))
                                .cornerRadius(200)

                                                                
                                Spacer()
                                
                                Image("jaklingko")
                                    .frame(width: 24, height: 24)
                                
                                Image("mail")
                                    .frame(width: 24, height: 24)
                                
                                Image("help")
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.horizontal, 40)
                            
                            //Container Items
                            HStack {
                                ForEach(homeItems, id: \.0) { item in
                                    if item.0 == "tripplan" {
                                        Button(action: {
                                            // Action to perform when the "Trip Plan" button is tapped

                                        }) {
                                            VStack {
                                                Image(item.0)
                                                    .frame(width: 24, height: 24)
                                                Text(item.1)
                                                    .font(.system(size: 14, weight: .medium))
                                                    .foregroundColor(Color("Primary"))
                                            }
                                        }
                                    } else {
                                        VStack {
                                            Image(item.0)
                                                .frame(width: 24, height: 24)
                                            Text(item.1)
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(Color("Primary"))
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                }
                            }
                            .padding(.top, 5)
                        }
                    
                    }.padding(.top, 15)
                    
                    
                }
                
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Event")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) { // Set the axis to .horizontal and hide the scroll indicators
                        HStack(spacing: 16) { // Add spacing between the images
                            Image("banner1")
                                .frame(width: 350, height: 189)
                            Image("banner2")
                                .frame(width: 350, height: 189)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                Text("Promos")
                    .font(.system(size: 18, weight: .bold))
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) { // Set the axis to .horizontal and hide the scroll indicators
                        HStack(spacing: 16) { // Add spacing between the images
                            Image("banner2")
                                .frame(width: 350, height: 189)
                            Image("banner1")
                                .frame(width: 350, height: 189)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)

            
        
            
            Spacer()
        }
        
        
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
