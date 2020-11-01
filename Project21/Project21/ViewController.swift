//
//  ViewController.swift
//  Project21
//
//  Created by Hubert Leszkiewicz on 20/10/2020.
//
import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "schedule", style: .plain, target: self, action: #selector(schedualLocal))
    }
    
    @objc func registerLocal() {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, Error in
            
            if granted {
                print("Yay!")
            } else {
                print("D'oh!")
            }
        }
        
    }
    
    @objc func schedualLocal() {
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm but, the second mouse the... blah blah blah, WAKE UP!"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzBuzz"]
        content.sound = .default
        
        var dateComponets = DateComponents()
        dateComponets.hour = 10
        dateComponets.minute = 30
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponets, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
    }
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more...", options: .foreground )
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("custom data received: \(customData)")
            
        switch response.actionIdentifier {
            
            case UNNotificationDefaultActionIdentifier:
//                the user swiped to unlock
            print("Default identifier")
                
            case "show":
                print("Show more information")
                
            default:
                break
                
            }
        }
        
        completionHandler()
    }

}

