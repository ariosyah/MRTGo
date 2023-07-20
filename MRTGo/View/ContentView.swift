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
    @StateObject var notificationManager = NotificationManager()
   
    
    var body: some View {
        HomeView()
            .onAppear{
                notificationManager.requestNotificationPermission()
                notificationManager.detectLocation()
                notificationManager.requestLocationPermission()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
