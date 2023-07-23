//
//  DestinationCardList.swift
//  MRTGo
//
//  Created by Dary Ramadhan on 20/07/23.
//

import SwiftUI

struct DestinationCardList: View {
    @State var arrayDestination: [DestinationItem]?
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) { // Adjust the spacing as needed
                    if let arrayDestination = arrayDestination {
                        ForEach(arrayDestination, id: \.name) { destinationItem in // Replace the range with your data or desired number of cards
                            DestinationCard(name: destinationItem.name, distance: destinationItem.distance)
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct DestinationCardList_Previews: PreviewProvider {
    static var previews: some View {
        DestinationCardList(arrayDestination: destinationItemDataArray)
    }
}
