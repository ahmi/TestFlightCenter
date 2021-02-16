//
//  FlightLocalStore.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 16/2/21.
//

import Foundation
let flightsLocalURL = Bundle.main.url(forResource: "Flights", withExtension: "json")

class FlightLocalStore: FlightStoreProtocol {
    func fetchFlightsList(completion: @escaping (FlightsAPIResult)) {
        guard let jsonFileURL = flightsLocalURL else {
            completion(.failure(.badURL))
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonFileURL)
            let json = try JSONDecoder().decode([Flight].self, from: jsonData)
            completion(.success(json))
        }
        catch {
            completion(.failure(.parsingError))
        }
    }
}
