//
//  FlightDetailPresenter.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 20/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FlightDetailPresentationLogic
{
  func presentSomething(response: FlightDetail.Something.Response)
}

class FlightDetailPresenter: FlightDetailPresentationLogic
{
  weak var viewController: FlightDetailDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: FlightDetail.Something.Response)
  {
    let viewModel = FlightDetail.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
