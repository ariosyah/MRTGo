//
//  NavigationStep.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import SwiftUI

struct NavigationStep: View {
    var body: some View {
        HStack(spacing:12){
            Image("marker-pin-departure")
                .resizable()
                .frame(width: 36,height: 36)
            VStack(alignment: .leading){
                Text("Keluar Kereta")
                    .font(Font.custom("HelveticaNeue",size:16))
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text("Stasiun Bundaran HI")
                    .font(Font.custom("HelveticaNeue",size:16))
                    .foregroundColor(Color("Gray-500"))
            }
            Spacer()
        }
        .frame(height: 48)
    }
}

struct NavigationStep_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStep()
    }
}
