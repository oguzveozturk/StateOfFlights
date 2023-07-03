//
//  Coordinates.swift
//  FlightAPI
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation

public struct Coordinates: Decodable, Equatable {
    public var latitudeMin: Double
    public var longitudeMin: Double
    public var latitudeMax: Double
    public var longitudeMax: Double
    
    public init(lamin: Double = 40.226013967,
                lomin: Double = 27.344531648,
                lamax: Double = 41.6004635693,
                lomax: Double = 30.7411966586) {
        self.latitudeMin = lamin
        self.longitudeMin = lomin
        self.latitudeMax = lamax
        self.longitudeMax = lomax
    }
    
    public init(coordinates:(lamin:Double,
                             lomin:Double,
                             lamax:Double,
                             lomax:Double)) {
        self.latitudeMin = coordinates.lamin
        self.longitudeMin = coordinates.lomin
        self.latitudeMax = coordinates.lamax
        self.longitudeMax = coordinates.lomax
    }
}
