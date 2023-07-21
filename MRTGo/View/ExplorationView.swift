//
//  ExplorationView.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

//@ViewBuilder

struct ExplorationView: View {
    
    var body: some View {
            VStack(alignment: .leading) {
                HeaderExploration()

                Text("Stasiun Bundaran HI")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("Primary"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                
                ScrollView {
                    //MARK: Exit 1
                    VStack(alignment: .leading) {
                        Text("Exit 1 (Pintu A)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("Gray-950"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        DestinationCardList(arrayDestination: destinationItemDataArray)
                    }
                    .padding(.bottom, 180)
                    
                    //MARK: Exit 2
                    VStack(alignment: .leading) {
                        Text("Exit 2 (Pintu B)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("Gray-950"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        DestinationCardList(arrayDestination: destinationItemDataArrayB)
                    }
                    .padding(.bottom, 180)
                    
                    //MARK: Exit 3
                    VStack(alignment: .leading) {
                        Text("Exit 3 (Pintu C)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("Gray-950"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        DestinationCardList(arrayDestination: destinationItemDataArrayC)
                    }
                    .padding(.bottom, 180)
                    
                    //MARK: Exit 4
                    VStack(alignment: .leading) {
                        Text("Exit 4 (Pintu D)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color("Gray-950"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        DestinationCardList(arrayDestination: destinationItemDataArrayD)
                    }
                }
                
                
            
        }
        
    }
}

struct ExplorationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorationView()
    }
}
