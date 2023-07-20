//
//  ProgressItem.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import SwiftUI

struct ProgressItem: View {
    var a = 1
    @State private var revealDetails = false
    var body: some View {
        VStack(alignment:.leading,spacing: 0){
            //Based Station
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
                    StripLine(color: Color("Secondary"), width: 4, height: .infinity)
                }
                .frame(height: .infinity)
                VStack(alignment:.leading,spacing: 0){
                    HStack{
                        //Define location name
                        Text("Stasiun Lebak Bulus")
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .foregroundColor(a == 1 ? .black : .blue)
                            .bold()
                        Image("marker-pin-departure")
                            .resizable()
                            .frame(width: 24,height: 24)
                    }
                    DisclosureGroup("11 Perhentian", isExpanded: $revealDetails) {
                        VStack(alignment: .leading,spacing: 10){
                            Text("Stasiun Fatmawati")
                            Text("Stasiun Cipete Raya")
                            Text("Stasiun Haji Nawi")
                            Text("Stasiun Haji Blok A")
                            Text("Stasiun Haji Blok M")
                            Text("Stasiun Sisimangraja")
                            Text("Stasiun Senayan")
                            Text("Stasiun Istora")
                            Text("Stasiun Benhil")
                            Text("Stasiun Setiabudi")
                        }
                    }
                    .frame(width: 150)
                    .foregroundColor(Color("Gray-500"))
                    .font(Font.custom("HelveticaNeue", size: 16))
                    .accentColor(Color("Gray-500"))
                    Spacer()
                }
            }
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
                    StripLine(color: Color("Secondary"), width: 4, height: .infinity)
                }
                VStack(alignment:.leading,spacing: 0){
                    HStack{
                        //Define location name
                        Text("Stasiun Lebak Bulus")
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .foregroundColor(a == 1 ? .black : .blue)
                            .bold()
                    }
                    Text("100 meter menuju Exit 1 (Pintu A)")
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .foregroundColor(Color("Primary"))
                        .fontWeight(.medium)
                    Spacer()
                }
            }
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
                        Text("Hotel Pullman Jakarta")
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .foregroundColor(a == 1 ? .black : .blue)
                            .bold()
                        Image("marker-pin-destination")
                            .resizable()
                            .frame(width: 24,height: 24)
                    }
                    Spacer()
                        
                }
                .padding(.vertical,4)
            }
            
            
        }
        .frame(height: 297)
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
        ProgressItem()
    }
}
