//
//  FlightCenter.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 14/2/21.
//

import UIKit
struct FlightCenter {
    
    /// All colors used in app are declared here , can be used globally
    struct AppColor {

        static let borderColor = UIColor(hex: "#e0e0e0")
        static let shadowColor = UIColor(hex: "#e0e0e0")
        
    }
    
/// Global strings
    struct AppStrings {
        static let flightDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        static let flightDateSectionHeaderFormat = "EEEE, MMMM dd"
        static let flightTimeFormat = "HH:mm"
    }
    
    struct DateWrraper {
        /// This function will convert date string from given format to required format
        /// This will  help sorting flights with same date and putting them in same array to show in same section in list
        
        static func formatDateString(strDate: String) -> String {
            let dateFormatter = DateFormatter()
            // Given Format -
            dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSS"
            let dateFromInputString = dateFormatter.date(from: strDate)
            //   now convert into format like Wenesday, 21 August
            dateFormatter.dateFormat = "EEEE, MMMM dd"
            if(dateFromInputString != nil){
                let date =  dateFormatter.string(from: dateFromInputString!)
                return date
            }
            return ""
        }
        
        static func convertStringToDateFullFormat(stringDate: String) -> Date? {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = FlightCenter.AppStrings.flightDateFormat
            guard let showDate = inputFormatter.date(from: stringDate) else { return nil }
            return showDate
        }
        static func convertStringToDate(date: Date) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = FlightCenter.AppStrings.flightDateFormat
            dateFormatter.dateFormat = "EEEE, MMMM dd"
            return dateFormatter.string(from: date)
            
        }
        static func convertDateStringToTime(date: String) -> String
        {
            let dateFormatter = DateFormatter()
            // Given Format -
            dateFormatter.dateFormat =  FlightCenter.AppStrings.flightDateFormat
            let dateFromInputString = dateFormatter.date(from: date)
            //   now convert into format like 07:15
            dateFormatter.dateFormat = FlightCenter.AppStrings.flightTimeFormat
            if(dateFromInputString != nil){
                let date =  dateFormatter.string(from: dateFromInputString!)
                return date
            }
            return ""
            
        }
    }
}

