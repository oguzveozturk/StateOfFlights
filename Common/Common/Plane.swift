//
//  Plane.swift
//  Common
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import FlightAPI
import MapKit

public class Plane: NSObject, MKAnnotation {
    public let country:Country
    public let longitude: Double
    public let latitude: Double
    public let icao24: String

    public init?(state:StateVector) {
        guard
            let longitude = state.longitude,
            let latitude = state.latitude
        else { return nil }
        self.country = Country(name: state.originCountry)
        self.longitude = Double(longitude)
        self.latitude = Double(latitude)
        self.icao24 = state.icao24
        super.init()
    }
    
    public var title: String? {
        return icao24
    }
    public var subtitle: String? {
        return country.name
    }
    
    public var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
