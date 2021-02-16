//
//  FlightAPIStore.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 15/2/21.
//

import Foundation


class FlightAPIStore: FlightStoreProtocol {
    
    func fetchFlightsList(completion: @escaping (FlightsAPIResult)) {
        let path =  "https://firebasestorage.googleapis.com/v0/b/flight-centre-brand.appspot.com/o/developer-test-flights-list.json?alt=media"//&token=81d93056-9c7f-451d-94b6-3e88eb6fa9ad"//"https://bit.ly/2MBaibj"
        
        guard let url = URL(string: path) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "token": "81d93056-9c7f-451d-94b6-3e88eb6fa9ad" ]
        
        let dataTask  = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                completion(.failure(.serverError))
                return
            }
            guard let data = data else {
                completion(.failure(.serverError))
                return
            }
            do {
                let str = String(decoding: data, as: UTF8.self)
                print(str)
                let object = try JSONDecoder().decode([Flight].self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        dataTask.resume()
    }
}
