//
//  FlightsViewController.swift
//  TestFlightCenter
//
//  Created by Ahmad Waqas on 14/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FlightsDisplayLogic: class
{
  func displaySomething(viewModel: Flights.DisplayFlightList.ViewModel)
}

class FlightsViewController: UIViewController, FlightsDisplayLogic
{
    var interactor: FlightsBusinessLogic?
    var router: (NSObjectProtocol & FlightsRoutingLogic & FlightsDataPassing)?
    var viewModel: Flights.DisplayFlightList.ViewModel
    
    @IBOutlet weak var tableFlights: UITableView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        self.viewModel = Flights.DisplayFlightList.ViewModel(response:.init(flights: [], message: nil))
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.viewModel = Flights.DisplayFlightList.ViewModel(response:.init(flights: [], message: nil))
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Constants
    struct Constants {
        static let flightTableViewCellIdentifier = "FlightTableViewCell"
        
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = FlightsInteractor()
        let presenter = FlightsPresenter()
        let router = FlightsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupTableView() {
        
        let cellNib = UINib(nibName: Constants.flightTableViewCellIdentifier, bundle: nil)
        tableFlights.register(cellNib, forCellReuseIdentifier: Constants.flightTableViewCellIdentifier)
        tableFlights.estimatedRowHeight = 172
        tableFlights.delegate = self
        tableFlights.dataSource = self
        tableFlights.reloadData()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        interactor?.fetchFlights()
    }
    
    // MARK: Do something
        
    func doSomething()
    {
        _ = Flights.DisplayFlightList.Request()
       // interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Flights.DisplayFlightList.ViewModel)
    {
        print("viewModel received inside viewcontroller: \(viewModel.groupedFlights)")
        self.viewModel = viewModel
        self.tableFlights.reloadData()
    }
}

extension FlightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let flightOnSingleDate = self.viewModel.groupedFlights[section]
        return flightOnSingleDate.sameDayFlights?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableFlights.dequeueReusableCell(withIdentifier: "FlightTableViewCell", for: indexPath) as! FlightTableViewCell
        let groupedFlight = self.viewModel.groupedFlights[indexPath.section]
        let flight = groupedFlight.sameDayFlights![indexPath.row]
        cell.configure(with: flight)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        router?.routeToFlightDetailScene(segue: nil)
    }
}

extension FlightsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.groupedFlights.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let flightOnSingleDate = self.viewModel.groupedFlights[section]
        return flightOnSingleDate.sectionHeader
    }
   
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = .clear
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = FlightCenter.AppColor.listHeaderTextColor
    }
}
