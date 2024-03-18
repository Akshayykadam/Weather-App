//
//  LocationManager.swift
//  SkyCast
//
//  Created by Akshay Kadam on 17/03/24.
//
import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super .init()
        manager.delegate = self
    }
    
    func RequestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location Error: ", error)
        isLoading = false
    }
}
