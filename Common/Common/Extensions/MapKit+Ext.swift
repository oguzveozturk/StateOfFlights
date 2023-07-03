//
//  MapKit+Ext.swift
//  Common
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import MapKit
import struct FlightAPI.Coordinates

public extension MKMapView {
    var topLeftCoordinate: CLLocationCoordinate2D {
        convert(.zero, toCoordinateFrom: self)
    }
    
    var bottomRightCoordinate: CLLocationCoordinate2D {
        convert(CGPoint(x: frame.width, y: frame.height), toCoordinateFrom: self)
    }
    
    var coordinates: (lamin:Double, lomin:Double, lamax:Double, lomax:Double) {
        let lamin: Double = bottomRightCoordinate.latitude
        let lomin: Double = topLeftCoordinate.longitude
        let lamax: Double = topLeftCoordinate.latitude
        let lomax: Double = bottomRightCoordinate.longitude
        return (lamin, lomin, lamax, lomax)
    }
}

public extension MKCoordinateRegion {
    enum cities {
        case istanbul
        
        public var region: MKCoordinateRegion {
            switch self {
            case .istanbul:
                return .init(
                    center: .init(latitude: 41.015137, longitude: 28.979530),
                    latitudinalMeters: 30000,
                    longitudinalMeters: 30000)
            }
        }
    }
}

public extension MKMapView {
    func registerDefault(type: MKMarkerAnnotationView.Type) {
        register(type, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    func defaultReusableAnnotation<T: MKMarkerAnnotationView>(with type: T.Type) -> T? {
        guard let annotation = dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? T else {
            return nil
        }
        return annotation
    }
}
