//
//  NetworkService.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 16/2/21.
//

import UIKit

enum NetworkingHelper {
    /// Type of API
    /// Add more cases and their info in variables
    case getFlightsList
    case AnyOtherCase

    
   ///Scheme same for all cases
    var scheme: String {
        switch self {
            case .getFlightsList, .AnyOtherCase:
                return "https"
        }
    }
   
    ///Domain name part of url
    var host: String {
        switch self {
            case .getFlightsList, .AnyOtherCase:
                return "domain name part of url"
        }
    }
    
    ///Path of url
    var path: String {
        switch self {
            case .getFlightsList, .AnyOtherCase:
                return "/path"
        }
    }
    /// Parameters for API
    var parameters: [URLQueryItem] {
        let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
        switch self {
            case .getFlightsList, .AnyOtherCase:
                return [URLQueryItem(name: "access_token", value: accessToken)]
        }
    }
    
    var method: String {
      switch self {
        case .getFlightsList, .AnyOtherCase:
          return "GET"
      }
    }
}


