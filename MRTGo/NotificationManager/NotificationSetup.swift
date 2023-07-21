//
//  NotificationSetup.swift
//  MRTGo
//
//  Created by yuri wardana on 20/07/23.
//

import Foundation
import UserNotifications
import CoreLocation

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
    
    func detectLocation(location: (latitude: Double, longitude: Double), name: String) {
        //apple -6.301912729640826, 106.65260511112984
        
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        let region = CLCircularRegion(center: center, radius: 500.0, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        locationManager.startMonitoring(for: region)
        notificationDictionary[region] = name
        
        print("track" + region.identifier)
    }
    
    func requestLocationPermission(){
        locationManager.delegate = self
//       locationManager.monitoredRegions
        locationManager.requestWhenInUseAuthorization()
    }
    
    func notificationHandler(name: String){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Notification location"
        notificationContent.body = "you've entered \(name)"
        
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
        notificationHandler(name: notificationDictionary[region] ?? "")
        notificationDictionary[region] = nil
        locationManager.stopMonitoring(for: region)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
    
}
