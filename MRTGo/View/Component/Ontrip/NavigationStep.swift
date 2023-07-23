//
//  NavigationStep.swift
//  MRTGo
//
//  Created by Radya Amirur Rahman on 20/07/23.
//

import SwiftUI


struct NavigationStep: View {
    var instruction: Instruction
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                instruction.dataImage
                    .resizable()
                    .frame(width: 36, height: 36)
                VStack(alignment: .leading,spacing: 4) {
                    Text(instruction.dataTitle)
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    
                    Text(instruction.dataSubtitle)
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .foregroundColor(Color("Gray-500"))
                }
                Spacer()
            }
            .frame(height: 48)
        }
    }
}



