//
//  EmptyState.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct EmptyState: View {
    @Binding var isDepartureChosen: Bool
    
    var body: some View {
        VStack{
            Image("illustration")
                .resizable()
                .scaledToFill()
                .frame(width: 227, height: 271)
            
            if isDepartureChosen{
                Text("Anda belum memilih destinasi")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)
                    .padding(.top, 50)
                Text("Silahkan pilih tujuan akhir diatas atau jelajahi destinasi")
                    .font(.system(size: 14, weight: .regular))
            }else{
                Text("Anda belum memilih stasiun")
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)
                    .padding(.top, 50)
                Text("Silahkan pilih stasiun keberangkatan diatas")
                    .font(.system(size: 14, weight: .regular))
            }
           
        }
    }
}

//struct EmptyState_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyState()
//    }
//}
