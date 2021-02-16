//
//  Flight.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 15/2/21.
//

import Foundation
struct Flight: Codable,Equatable
{
    let id: Int
    let departure_date: String
    let airline_code: String
    let flight_number: String
    let departure_city: String
    let departure_airport: String
    let arrival_city: String
    let arrival_airport: String
    let scheduled_duration: String
    let arrival_date: String
}
