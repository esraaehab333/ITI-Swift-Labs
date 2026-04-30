//
//  NetworkChecker.swift
//  lab2_2
//
//  Created by Nemo on 29/04/2026.
//
import Network

class NetworkChecker {
    static let shared = NetworkChecker()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global()
    
    var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = (path.status == .satisfied)
        }
        monitor.start(queue: queue)
    }
}
