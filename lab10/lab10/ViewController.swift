//
//  ViewController.swift
//  lab10
//
//  Created by Nemo on 30/04/2026.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let userNotification = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNotification.delegate = self
        requestAuthorization()
    }
    
    func requestAuthorization(){
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert , .badge , .sound)
        userNotification.requestAuthorization(options: authOptions) { (success , error) in
            guard let error = error else { return }
            print(error.localizedDescription)
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,didReceive response: UNNotificationResponse,withCompletionHandler completionHandler: @escaping () -> Void) {
        DispatchQueue.main.async {
            if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            completionHandler()
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    @IBAction func SetReminderBtn(_ sender: Any) {
        // 1. create the content
        let content = UNMutableNotificationContent()
        content.title = "Scheduled Reminder"
        content.body = "This notification was triggered in the selected time"
        content.sound = .default
        content.badge = 1

        // 2. set the time
        var dateComponents = DateComponents()
        dateComponents.hour = 13
        dateComponents.minute = 14
        
        // 3. create the trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // 4. create the request
        let request = UNNotificationRequest(identifier: "dateReminder", content: content, trigger: trigger)

        // 5. Add the request
        userNotification.add(request)
    }
    
    @IBAction func SecTimeoutBtn(_ sender: Any) {
        // 1. create content
        let content = UNMutableNotificationContent()
        content.title = "Time Interval"
        content.body = "this is a 10 sec timeout notification"
        content.badge = NSNumber(value: 3)
        if let url = Bundle.main.url(forResource: "1", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier:"timeInterval", url: url, options: nil){
                content.attachments = [attachment]
            }
        }
        
        // 2. create the trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // 3. create the request
        let request = UNNotificationRequest(identifier: "timeInterval", content: content, trigger: trigger)
        
        //4. Add request
        userNotification.add(request, withCompletionHandler: nil)
    }
}

