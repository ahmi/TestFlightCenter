//
//  LogicalFlights.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 18/2/21.
//
//This will be our viewModel 
import Foundation
struct LogicalFlights {
    internal init(
        sectionHeader: String? = nil,
        sectionHeaderDate: Date? = nil,
        sameDayFlights: [LogicalSingleFlight]? = nil
    ) {
        self.sectionHeader = sectionHeader
        self.sectionHeaderDate = sectionHeaderDate
        self.sameDayFlights = sameDayFlights
    }
    
    var sectionHeader: String?
    var sectionHeaderDate: Date?
    var sameDayFlights: [LogicalSingleFlight]?
}

struct LogicalSingleFlight {
    internal init(
        flightID: Int = 0,
        departureCityShortName: String? = nil,
        departureCityFullName: String? = nil,
        arrivalCityShortName: String? = nil,
        arrivalCityFullName: String? = nil,
        departureTimeShort: String? = nil,
        arrivalTimeShort: String? = nil,
        flightStops: String? = nil,
        flightduration: String? = nil
    ) {
        self.departureCityShortName = departureCityShortName
        self.departureCityFullName = departureCityFullName
        self.arrivalCityShortName = arrivalCityShortName
        self.arrivalCityFullName = arrivalCityFullName
        self.departureTimeShort = departureTimeShort
        self.arrivalTimeShort = arrivalTimeShort
        self.flightStops = flightStops
        self.flightduration = flightduration
        self.flightID = flightID
    }
    
    var departureCityShortName: String?
    var departureCityFullName: String?
    var arrivalCityShortName: String?
    var arrivalCityFullName: String?
    var departureTimeShort: String?
    var arrivalTimeShort: String?
    var flightStops: String?
    var flightduration: String?
    var flightID: Int = 0
    
}
