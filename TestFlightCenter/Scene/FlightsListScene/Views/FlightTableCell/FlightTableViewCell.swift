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
    
    /// Constants to be used in UI
    typealias Colors = FlightCenter.AppColor
    struct Constants {
        static let contentViewBorderWidth: CGFloat = 1.0
        static let contentViewShadowRadius: CGFloat = 2.0
        static let contentViewCornerRadius: CGFloat = 4.0
        static let contentViewShadowColor: CGColor = UIColor(red: 0.00, green:0.00, blue:0.00, alpha:0.40).cgColor
        static let contentViewBorderColor: CGColor = UIColor(red: 0.00, green:0.00, blue:0.00, alpha:0.14).cgColor
    }
    
    //MARK:- Functions
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderWidth = Constants.contentViewBorderWidth
        containerView.layer.borderColor = Constants.contentViewBorderColor
        containerView.layer.cornerRadius = Constants.contentViewCornerRadius
        containerView.layer.shadowRadius = Constants.contentViewShadowRadius
        containerView.layer.shadowColor = Constants.contentViewShadowColor
        containerView.layer.shadowOpacity = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
