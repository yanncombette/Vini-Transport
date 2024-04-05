//
//  ViniMapViewRepresentable.swift
//  Vini-Transport
//
//  Created by yann combette on 05/04/2024.
//

import SwiftUI
import MapKit

struct ViniMapViewRepresentable: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // No specific update code needed at the moment
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}


extension ViniMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate{
        let parent: ViniMapViewRepresentable
        
        init(parent: ViniMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
