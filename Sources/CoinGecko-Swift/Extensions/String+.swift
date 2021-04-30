//
// GeneCrucean.swift
//

import Foundation

extension String {
    func toObject<T: Decodable>() throws -> T {
        let data = Data(self.utf8)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
