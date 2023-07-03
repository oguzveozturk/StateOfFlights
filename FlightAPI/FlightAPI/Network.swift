//
//  Network.swift
//  FlightAPI
//
//  Created by Oğuz Öztürk on 8.06.2023.
//

import Foundation
import Alamofire

public protocol AllStatesProtocol {
    func getAllStates(coordinates:Coordinates, _ completion: @escaping (DataResponse<FlightState,AFError>) -> Void)
}

public class Network: AllStatesProtocol {
    public init() { }
    
    public func getAllStates(coordinates:Coordinates, _ completion: @escaping (DataResponse<FlightState,AFError>) -> Void) {
        AF.request(NetworkRequest.getAllStates(coor: coordinates)).responseDecodable(of: FlightState.self,completionHandler: completion)
    }
}
