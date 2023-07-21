//
//  ContentView.swift
//  MRTGo
//
//  Created by Ario Syahputra on 18/07/23.
//

import SwiftUI
import CoreLocation
import UserNotifications

struct ContentView: View {
    
    var body: some View {
        HomeView()
            .onAppear{
                NotificationManager.shared.requestNotificationPermission()
                NotificationManager.shared.requestLocationPermission()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
