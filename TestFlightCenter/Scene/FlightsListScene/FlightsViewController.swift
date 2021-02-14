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
  func displaySomething(viewModel: Flights.FlightModel.ViewModel)
}

class FlightsViewController: UIViewController, FlightsDisplayLogic
{
    var interactor: FlightsBusinessLogic?
    var router: (NSObjectProtocol & FlightsRoutingLogic & FlightsDataPassing)?
    
    @IBOutlet weak var tableFlights: UITableView!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
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
        //doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Flights.FlightModel.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Flights.FlightModel.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}

extension FlightsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableFlights.dequeueReusableCell(withIdentifier: "FlightTableViewCell", for: indexPath) as! FlightTableViewCell
        return cell
    }
}

extension FlightsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
}
