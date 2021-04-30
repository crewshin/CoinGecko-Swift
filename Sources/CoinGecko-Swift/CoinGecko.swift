//
// GeneCrucean.swift
//

import Foundation

public class CoinGecko {
    private let networking: Networking
    private var baseURL: URL
    
    public init(api: API, networking: Networking = Networking()) {
        self.baseURL = URL(string: api.rawValue)!
        self.networking = networking
    }
    
    // MARK: - Calls
    
    /// Returns all account information associated with the account of provided pubkey.
    /// https://docs.solana.com/developing/clients/jsonrpc-api#getaccountinfo
    public func ping(completion: @escaping (Result<Networking.Response<PingResponse>, APIError>) -> Void) {

        var request = URLRequest(url: baseURL.appendingPathComponent("/ping"))
        request.httpMethod = HTTPRequestType.get.rawValue

        networking.codableTask(request: request) { (result: Result<Networking.Response<PingResponse>, Error>) in
            switch result {
            case .failure(let error):
                completion(.failure(.generic(message: error.localizedDescription)))
            case .success(let res):
                completion(.success(res))
            }
        }
    }
}
