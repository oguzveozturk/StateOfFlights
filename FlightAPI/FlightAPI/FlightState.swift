//
//  FlightState.swift
//  FlightAPI
//
//  Created by Oğuz Öztürk on 8.06.2023.
//

import Foundation

public struct FlightState: Decodable, Equatable {
    let time: Int
    public let states: [StateVector]?
}

public struct StateVector: Decodable, Equatable {
    public let icao24: String
    let callSign: String
    public let originCountry: String
    let timePosition: Int?
    let lastContact: Int
    public let longitude: Float?
    public let latitude: Float?
    let baroAltitude: Float?
    let onGround: Bool
    let velocity: Float?
    let trueTrack: Float?
    let verticalRate: Float?
    let sensors: [Int]?
    let geoAltitude: Float?
    let squawk: String?
    let spi: Bool
    let positionSource: Int
    
    public init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()
        self.icao24 = try values.decode(String.self)
        self.callSign = try values.decode(String.self)
        self.originCountry = try values.decode(String.self)
        self.timePosition = try values.decodeIfPresent(Int.self)
        self.lastContact = try values.decode(Int.self)
        self.longitude = try values.decodeIfPresent(Float.self)
        self.latitude = try values.decodeIfPresent(Float.self)
        self.baroAltitude = try values.decodeIfPresent(Float.self)
        self.onGround = try values.decode(Bool.self)
        self.velocity = try values.decodeIfPresent(Float.self)
        self.trueTrack = try values.decodeIfPresent(Float.self)
        self.verticalRate = try values.decodeIfPresent(Float.self)
        self.sensors = try values.decodeIfPresent([Int].self)
        self.geoAltitude = try values.decodeIfPresent(Float.self)
        self.squawk = try values.decodeIfPresent(String.self)
        self.spi = try values.decode(Bool.self)
        self.positionSource = try values.decode(Int.self)
    }
}
