
//
//  ViewController.swift
//  lab9
//
//  Created by Nemo on 29/04/2026.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    @IBAction func saveBtn(_ sender: Any) {
        let url = URL(string: "https://tse2.mm.bing.net/th/id/OIP.FAdDQOzNntGzAL6hRb3JMwHaE7?w=800&h=533&rs=1&pid=ImgDetMain&o=7&rm=3")
        guard let myUrl = url else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let data = try Data(contentsOf: myUrl)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in
                        self?.myImage.image = image
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        syncAsync()
        runOperationQueueDemo()
    }
    
    func syncAsync() {
        DispatchQueue.global().async {
            for _ in 1...5 { print("🍩") }
        }
        DispatchQueue.global().sync {
            for _ in 1...5 { print("🍩") }
        }
        DispatchQueue.global().sync {
            for _ in 1...5 { print("🍟") }
        }
        DispatchQueue.global().async {
            for _ in 1...5 { print("🍟") }
        }
    }

    func runOperationQueueDemo() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 2
        let op1 = BlockOperation {
            for i in 1...3 {
                print("op1(\(i))")
                sleep(1)
            }
        }
        let op2 = BlockOperation {
            for i in 1...3 {
                print("op2(\(i))")
                sleep(1)
            }
        }
        op2.addDependency(op1)
        let op3 = BlockOperation()
        op3.addExecutionBlock { print("add code ") }
        let op4 = BlockOperation { print("op4 is run")}
        op4.cancel()
        op1.completionBlock = { print("op1 is complete") }
        queue.isSuspended = true
        queue.addOperations([op1, op2, op3, op4], waitUntilFinished: false)
        DispatchQueue.global().async {
            sleep(1)
            queue.isSuspended = false
        }
    }
}
