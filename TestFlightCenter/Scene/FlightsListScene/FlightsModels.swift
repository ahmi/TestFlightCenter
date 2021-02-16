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
  
  enum FlightModel
  {
    struct Request {
        
    }
    struct Response: Codable
    {
        var flights: [Flight]
        var message: String
        init(flights: [Flight]?, message: String?)  {
            self.flights = flights ?? []
            self.message = message ?? FlightStoreError.unknown.errorMessage
        }
    }
    struct ViewModel
    {
        var flightDate: Date? = Date()
        var flightDateHeader: String? = ""
        var flightInfo: [FlightInfo]? = []
        
        let dateFormatter: DateFormatter = {
          let dateFormatter = DateFormatter()
          dateFormatter.dateStyle = .short
          dateFormatter.timeStyle = .none
          return dateFormatter
        }()
        internal init(flightDate: Date, flightDateHeader: String, flightInfo: [Flights.FlightModel.ViewModel.FlightInfo]) {
            self.flightDate = flightDate
            self.flightDateHeader = flightDateHeader
            self.flightInfo = flightInfo
        }
        
        struct FlightInfo {
            
            var flightHeadline: String?
            var departureCityShortName: String?
            var departureCityFullName: String?
            var arrivalCityShortName: String?
            var arrivalCityFullName: String?
            var departureTimeShort: String?
            var departureTimeFull: Date?
            var arrivalTimeShort: String?
            var arrivalTimeFull: Date?
            var flightStops: String?
            var flightduration: String?
            
            internal init(flightHeadline: String? = "", departureCityShortName: String? = "", departureCityFullName: String? = "", arrivalCityShortName: String? = "", arrivalCityFullName: String? = "", departureTimeShort: String? = "", departureTimeFull: Date? = nil, arrivalTimeShort: String? = "", arrivalTimeFull: Date? = nil, flightStops: String? = "", flightduration: String? = "") {
                self.flightHeadline = flightHeadline
                self.departureCityShortName = departureCityShortName
                self.departureCityFullName = departureCityFullName
                self.arrivalCityShortName = arrivalCityShortName
                self.arrivalCityFullName = arrivalCityFullName
                self.departureTimeShort = departureTimeShort
                self.departureTimeFull = departureTimeFull
                self.arrivalTimeShort = arrivalTimeShort
                self.arrivalTimeFull = arrivalTimeFull
                self.flightStops = flightStops
                self.flightduration = flightduration
            }
            
        }
    }
  }
}

///Temp function here for convenience , should move to Global Struct

extension NetworkingHelper {
  
    /// This function will convert date string from given format to required format
    /// This will  help sorting flights with same date and putting them in same array to show in same section in list
    
    static func formatDateString(strDate: String) {
        let dateFormatter = DateFormatter()
        //Given format
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        let dateFromInputString = dateFormatter.date(from: strDate)
   
        //   now convert into format like Wenesday, 21 August
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        /* Tired now */
      
        if(dateFromInputString != nil){
           let date =  dateFormatter.string(from: dateFromInputString!)
            print(date)
        }
        else{
           debugPrint("could not convert date")
           print ("N/A")
        }
    }
}
