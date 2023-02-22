//
//  NetworkRequester.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation

final class Requester {
    func doRequest<T:Decodable>(request: APIRequest)async throws -> T {
        do {
            let networkRequest = NetworkRequest(apiRequest: request)
            let (data, response) = try await URLSession.shared.data(for: networkRequest.request)
            
            guard let response = response as? HTTPURLResponse else {throw NetworkError.httpError}
            
            if response.statusCode == 200 {
                
                do{
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkError.dataInvalid
                }
            } else {
                throw NetworkError.status(response.statusCode)
            }
            
        }catch let error as NetworkError{
            throw error
        } catch {
            throw NetworkError.general(error)
        }
        
    }
}
