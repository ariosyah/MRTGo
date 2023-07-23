//
//  EmptyState.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct EmptyState: View {
    @Binding var departure: String
    @Binding var destination: String
    @Binding var isDepartureChosen: Bool
    @Binding var isDestinationChosen: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            Image(colorScheme == .light ? "illustration" : "illustration-dark")
                .resizable()
                .scaledToFill()
                .frame(width: 227, height: 271)
                .padding(.vertical, 5)
            
            if isDepartureChosen{
                Text("Anda belum memilih destinasi")
                    .font(Font.custom("HelveticaNeue", size: 18))
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                    .padding(.top, 50)
                Text("Silahkan pilih tujuan akhir diatas atau jelajahi destinasi")
                    .font(.system(size: 14, weight: .regular))
                NavigationLink {
                    ExplorationView()
                } label: {
                    Text("Jelajahi Destinasi")
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 342, height: 56)
                        .background(Color("Primary"))
                        .cornerRadius(200)
                }
                .padding(.top, 30)
                
                
            }else{
                Text("Anda belum memilih stasiun")
                    .font(Font.custom("HelveticaNeue", size: 18))
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                    .padding(.top, 50)
                Text("Silahkan pilih stasiun keberangkatan diatas")
                    .font(Font.custom("HelveticaNeue", size: 14))
                    .fontWeight(.regular)
                
            }
        }
    }
}
