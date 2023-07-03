//
//  Country.swift
//  Common
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation

public struct Country: Equatable, Hashable {
    public var name:String
    public var flag:String?

    public var title:String { "\(flag ?? " ") \(name)" }
    
    public init(name: String) {
        self.name = name
        self.flag = SwiftFlags.flag(for: name)
    }
}
