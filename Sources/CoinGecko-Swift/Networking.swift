//
// GeneCrucean.swift
//

import Foundation

// MARK: - Networking
public struct Networking {
    
    var globalHeaders: [String: String] = {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        headers["accept"] = "application/json"
        return headers
    }()
    
    public init() {}
    
    public struct Response<T> {
        public let value: T
        public let response: URLResponse
    }
    
    public func codableTask<T: Decodable>(request: URLRequest, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<Response<T>, Error>) -> Void) {
        
        var tmpRequest = request
        
        globalHeaders.forEach { (key, value) in
            tmpRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: tmpRequest) { (data, response, error) in
            guard let data = data,
                  error == nil,
                  let response = response,
                  let objectOutput = try? JSONDecoder().decode(T.self, from: data)
            else {
                completion(.failure(APIError.generic(message: "There was an issue decoding the response.")))
                return
            }

            completion(.success(Response(value: objectOutput, response: response)))
            
        }.resume()
    }
}
