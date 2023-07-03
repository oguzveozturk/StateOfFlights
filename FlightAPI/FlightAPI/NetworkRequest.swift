//
//  NetworkRequest.swift
//  FlightAPI
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import Alamofire

fileprivate let USERNAME = ""
fileprivate let PASS = ""

public enum NetworkRequest: URLRequestConvertible {
    
    static let endpoint = URL(string: "https://\(USERNAME):\(PASS)@opensky-network.org/api")!
    
    case getAllStates(coor: Coordinates)
    
    var path: String {
        switch self {
        case .getAllStates:
            return "/states/all"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllStates:
            return .get
        }
    }
    
    var encoding: URLEncoding {
        switch self {
        default:
            return .default
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getAllStates(let coor):
            return ["lamin":coor.latitudeMin,
                    "lomin":coor.longitudeMin,
                    "lamax":coor.latitudeMax,
                    "lomax":coor.longitudeMax]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: NetworkRequest.endpoint.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request = try encoding.encode(request, with: parameters)
        return request
    }
}
