//
//  DetailExplorationView.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

struct DetailExplorationView: View {
    
    @State var arrayStation: [StationItemData]
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderExploration()
            
            //Pilih Stasiun
            Text("Pilih Stasiun")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Color("Primary"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 15)
                .padding(.bottom, 8)
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) { // Adjust the spacing as needed
                        //                        ForEach(0..<10) { index in // Replace the range with your data or desired number of cards
                        //
                        //                        }
                        if let arrayStation = arrayStation {
                            ForEach(arrayStation, id: \.name) { stationItemArray in
                                NavigationLink {
                                    ExplorationView()
                                } label: {
                                    StationItem(name: stationItemArray.name, exit: stationItemArray.exit)
                                }
                                
                            }
                            //                            ForEach(arrayStation, id: \.name) { stationItemArray in
                            //                                                    NavigationLink(destination: ExplorationView(stationName: stationItemArray.name)) {
                            //                                                        StationItem(name: stationItemArray.name, exit: stationItemArray.exit)
                            //                                                    }
                            //                                                }
                            //                        }
                            
                        }
                        
                    }
                }
            }
            
        }
    }
    
    struct DetailExplorationView_Previews: PreviewProvider {
        static var previews: some View {
            DetailExplorationView(arrayStation: stationItemDataArray)
        }
        
    }
}
