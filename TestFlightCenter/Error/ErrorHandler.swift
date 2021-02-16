//
//  ErrorHandler.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 15/2/21.
//

import UIKit

enum FlightStoreError: Equatable, Error
{
    case badURL
    case serverError
    case parsingError
    case unknown
    var errorMessage: String {
        switch self {
            case .badURL:
                return "Bad URL"
            case .serverError:
                return "Request Failed"
            case .unknown:
                return "Unknown error"
            case .parsingError:
                return "Data error. Please try later"
        }
    }
}
