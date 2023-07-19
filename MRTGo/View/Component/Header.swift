//
//  Header.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct Header: View {
    @State var departure = ""
    @State var destination = ""
    var body: some View {
        ZStack{
            //Blue Header
            Rectangle()
            .foregroundColor(Color("Primary"))
            .ignoresSafeArea(.all)
            .frame(width: 400, height: 200)
            
            //Textfield
            VStack{
                Text("Trip Plan")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                
                //Departure Textfield
                ZStack(alignment: .leading) {
                    Image("marker-pin-departure")
                        .resizable()
                        .frame(width: 24, height: 24)
                    if departure.isEmpty {
                        Text("Pilih Stasiun Keberangkatan")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 40)
                    }
                    
                    TextField("", text: $departure)
                        .padding(.leading, 40)
                        .foregroundColor(Color("Primary"))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                
                //Destination Textfield
                ZStack(alignment: .leading) {
                    Image("marker-pin-destination")
                        .resizable()
                        .frame(width: 24, height: 24)
                    if destination.isEmpty {
                        Text("Pilih Tujuan")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 40)
                    }
                    
                    TextField("", text: $destination)
                        .padding(.leading, 40)
                        .foregroundColor(Color("Primary"))

                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(200)
                .padding(.horizontal, 20)
                
            }
            .padding(.bottom, 40)
            
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
