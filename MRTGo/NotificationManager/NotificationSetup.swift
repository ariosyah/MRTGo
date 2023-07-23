//
//  NotificationSetup.swift
//  MRTGo
//
//  Created by yuri wardana on 20/07/23.
//

import Foundation
import UserNotifications
import CoreLocation

enum LocationType {
    case departure
    case target
    case destination
}

class NotificationManager : NSObject,ObservableObject,UNUserNotificationCenterDelegate,CLLocationManagerDelegate{
    var notificationCenter = UNUserNotificationCenter.current()
    private let locationManager = CLLocationManager()
    
    var notificationDictionary = [CLRegion:String]()
    
    private override init() { }
    static let shared = NotificationManager()
    
    func requestNotificationPermission(){
        notificationCenter.delegate = self
        
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]){ (granted, error) in
           
            if granted {
                print("notification permission granted")
            }else{
                print("notification permission denied")
            }
            
        }
    }
    
    func detectLocation(location: (latitude: Double, longitude: Double), name: String, locationType: LocationType) {
        //apple -6.301912729640826, 106.65260511112984
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        let region = CLCircularRegion(center: center, radius: 500.0, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        locationManager.startMonitoring(for: region)
        notificationDictionary[region] = name
        notificationHandler(name: name, locationType: locationType)
        print("tes masuk")
    }
    
    func requestLocationPermission(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func notificationHandler(name: String, locationType: LocationType){
        let notificationContent = UNMutableNotificationContent()
        print(name)
        switch locationType {
        case .departure:
            notificationContent.title = "Selamat datang di stasiun awal"
            notificationContent.body = "Anda terdeteksi berada di \(name)"
        case .target:
            notificationContent.title = "Tujuan Anda dekat dengan \(Constants.attractions.first(where: { $0.nearbyAttractions.contains(where: { $0.lowercased() == name.lowercased() }) })?.name ?? "Exit B")"
            notificationContent.body = "Silakan pilih \(Constants.attractions.first(where: { $0.nearbyAttractions.contains(where: { $0.lowercased() == name.lowercased() }) })?.name ?? "Exit B" ) untuk melanjutkan perjalanan ke destinasi Anda."
        case .destination:
            notificationContent.title = "Anda telah mencapai tujuan"
            notificationContent.body = "Anda terdeteksi berada di \(name)"
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5 , repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request){ (error) in
            if let error = error{
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification Scheduled")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        notificationDictionary[region] = nil
        locationManager.stopMonitoring(for: region)
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
    
}
