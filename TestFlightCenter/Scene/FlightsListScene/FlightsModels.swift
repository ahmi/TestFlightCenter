//
//  FlightsModels.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 14/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Flights
{
    // MARK: Use cases
    
    enum DisplayFlightList
    {
        /// Construct request for a single use case
        struct Request {
            
        }
      
        /// Holds Data exactly as receieved
        struct Response: Codable
        {
            var flights: [Flight]
            var message: String
            init(flights: [Flight]?, message: String?)  {
                self.flights = flights ?? []
                self.message = message ?? FlightStoreError.unknown.errorMessage
            }
        }
        
        ///Flight List ViewModel Constructs and holds data as required by UI
        struct ViewModel
        {
            var groupedFlights = [LogicalFlights]() //[Date:[Flight]]()
            var message: String?
            
            init(response: Flights.DisplayFlightList.Response ) {
                self.groupedFlights = self.parseFlights(flightList: response.flights)
                self.message = response.message
            }
            
            private func parseFlights(flightList: [Flight] ) -> [LogicalFlights] {
                let empty: [Date: [Flight]] = [:]
                let groupedByDate = flightList.reduce(into: empty) { acc, currentFlight in
                    guard let departeDate = currentFlight.departure_date.convertStringToDateFullFormat() else { return }
                    let components = Calendar.current.dateComponents([.year, .month, .day], from: departeDate)
                    let date = Calendar.current.date(from: components)!
                    let existing = acc[date] ?? []
                    acc[date] = existing + [currentFlight]
                }
                
                var finalArray = [LogicalFlights]()
                let _ = groupedByDate.map { (flightDict) -> [LogicalFlights] in
                    
                    let logicalFlightTopObject = LogicalFlights.init(
                        sectionHeader: FlightCenter.DateWrraper.convertStringToDate(date: flightDict.key),
                        sectionHeaderDate: flightDict.key,
                        sameDayFlights: flightDict.value.map { (flight) -> LogicalSingleFlight in
                            
                            return  LogicalSingleFlight.init(
                                departureAirport: flight.departure_airport,
                                departureCityFullName: flight.departure_city,
                                arrivalCityShortName: flight.arrival_airport,
                                arrivalCityFullName: flight.arrival_city,
                                departureTimeShort: FlightCenter.DateWrraper.convertDateStringToTime(date: flight.departure_date),
                                arrivalTimeShort: FlightCenter.DateWrraper.convertDateStringToTime(date:        flight.arrival_date),
                                arrivalAirport: flight.arrival_airport,
                                flightStops: "Non-stop",
                                flightduration: flight.scheduled_duration
                            )
                        }
                    )
                    finalArray.append(logicalFlightTopObject)
                    return finalArray
                }
                return finalArray
            }
        }
    }
}
