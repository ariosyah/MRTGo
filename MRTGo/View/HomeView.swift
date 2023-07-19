//
//  HomeView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        
        VStack {
            
            //Header
            Header()
            
            Spacer()
            
            //Empty State
            EmptyState()
            
            Spacer()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
