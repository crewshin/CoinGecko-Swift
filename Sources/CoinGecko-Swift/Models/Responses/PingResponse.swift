//
// GeneCrucean.swift
//

import Foundation

public struct PingResponse: Codable {
    public let geckoSays: String

    enum CodingKeys: String, CodingKey {
        case geckoSays = "gecko_says"
    }
}
