//
//  FlightTableViewCell.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 14/2/21.
//

import UIKit

class FlightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFlightHeader: UILabel!
    @IBOutlet weak var lblFromCityShort: UILabel!
    @IBOutlet weak var lblFromCityFullName: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblNumberOfStops: UILabel!
    @IBOutlet weak var lblDestinationCityShort: UILabel!
    @IBOutlet weak var lblArrivalTime: UILabel!
    @IBOutlet weak var lblDestinationCityFull: UILabel!
    @IBOutlet weak var lblDepartTime: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    /// Constants to be used in UI
    typealias Colors = FlightCenter.AppColor
    struct Constants {
        static let contentViewBorderWidth: CGFloat = 1.0
        static let contentViewShadowRadius: CGFloat = 2.0
        static let contentViewCornerRadius: CGFloat = 4.0
    }
        
    //MARK:- Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
   
    private func setupUI(){
        containerView.layer.borderWidth = Constants.contentViewBorderWidth
        containerView.layer.borderColor = FlightCenter.AppColor.contentViewBorderColor
        containerView.layer.cornerRadius = Constants.contentViewCornerRadius
        containerView.layer.shadowRadius = Constants.contentViewShadowRadius
        containerView.layer.shadowColor = FlightCenter.AppColor.contentViewShadowColor
        containerView.layer.shadowOpacity = 1
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension FlightTableViewCell {
    func configure(with flightData: LogicalSingleFlight)  {
      
        self.lblNumberOfStops.text = flightData.flightStops
        
        if let duration = flightData.flightduration {
            self.lblDuration.text = duration
        }
        
        if let arrivalCityShort = flightData.arrivalCityFullName{
            self.lblFlightHeader.text = "Flight to " + FlightCenter.StringHelper.getShortStringSepratedByComma(mainString: arrivalCityShort)
        }
        
        if let arrivalCityFull = flightData.departureCityFullName{
            self.lblFromCityFullName.text = arrivalCityFull
        }
        
        if let destinationCityShort = flightData.departureAirport{
            self.lblDestinationCityShort.text = destinationCityShort
        }
        
        if let destinationCityFull = flightData.arrivalCityFullName {
            self.lblDestinationCityFull.text = destinationCityFull
        }
        if let arrivalTime = flightData.arrivalTimeShort{
            self.lblArrivalTime.text = arrivalTime
        }
        if let departTime = flightData.departureTimeShort{
            self.lblDepartTime.text = departTime
        }
        if let arrivalAirport = flightData.arrivalAirport {
            self.lblFromCityShort.text = arrivalAirport
        }
        

    }
}
