//
//  FlightsPresenter.swift
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

protocol FlightsPresentationLogic
{
  func presentSomething(response: Flights.DisplayFlightList.ViewModel)
}

class FlightsPresenter: FlightsPresentationLogic
{
    func presentSomething(response: Flights.DisplayFlightList.ViewModel) {
        print("viewModel received inside Presenter: \(response.groupedFlights)")

        viewController?.displaySomething(viewModel: response)
    }
    
  weak var viewController: FlightsDisplayLogic?
  

  
}
