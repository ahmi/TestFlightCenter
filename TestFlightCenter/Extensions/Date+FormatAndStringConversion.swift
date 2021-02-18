//
//  Date+FormatAndStringConversion.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 17/2/21.
//

import UIKit
extension String {
    
    func convertDateString() -> String? {
        return convert(dateString: self, fromDateFormat: FlightCenter.AppStrings.flightDateFormat, toDateFormat:FlightCenter.AppStrings.flightDateSectionHeaderFormat)
    }

   private func convert(dateString: String, fromDateFormat: String, toDateFormat: String) -> String? {

        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromDateFormat

        if let fromDateObject = fromDateFormatter.date(from: dateString) {

            let toDateFormatter = DateFormatter()
            toDateFormatter.dateFormat = toDateFormat

            let newDateString = toDateFormatter.string(from: fromDateObject)
            return newDateString
        }

        return nil
    }
    
/// Converts String to Date
    func convertStringToDateFullFormat() -> Date? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = FlightCenter.AppStrings.flightDateFormat
        guard let showDate = inputFormatter.date(from: self) else { return nil }
        return showDate
    }
}
