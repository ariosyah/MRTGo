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
    
    @Published var userLocation : CLLocation?
    
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
    
    func detectLocation(){
        //apple -6.301912729640826, 106.65260511112984
        
        let center = CLLocationCoordinate2D(latitude: -6.301912729640826, longitude: 106.65260511112984)
        
        let region = CLCircularRegion(center: center, radius: 500.0, identifier: "")
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        locationManager.startMonitoring(for: region)
    }
    
    func requestLocationPermission(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func notificationHandler(){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Notification location"
        notificationContent.body = "you've entered the specified destination"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5 , repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request){ (error) in
            if let error = error{
                print("Error scheduling notification: \(error)")
            }else {
                print("Location-based notification scheduled, masuk area")
                print(notificationContent)
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        notificationHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.notification.request.identifier
        
        print(identifier)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.banner)
    }
    
}
