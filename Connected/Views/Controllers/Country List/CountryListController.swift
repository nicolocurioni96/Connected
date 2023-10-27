//
//  CountryListController.swift
//  Connected
//
//  Created by Nicolò Curioni on 24/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import UIKit
import Combine

class CountryListController: UITableViewController {
    private let viewModel = CountryViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: - View Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        loadViewModel()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        reloadData()
    }
    
    // MARK: - Private methods
    private func setupUI() {
        title = "Connected"
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(CountryViewCell.self, forCellReuseIdentifier: CountryViewCell.identifier)
    }
    
    private func reloadData() {
        tableView.reloadData()
    }
    
    private func loadViewModel() {
        viewModel.fetchCountries()
    }
    
    func bindViewModel() {
        viewModel.$countries
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    
                    self.reloadData()
                }
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryViewCell.identifier, for: indexPath) as! CountryViewCell
        let country = viewModel.countries[indexPath.row]
        
        cell.countryNameLabel.text = country.name
        
        debugPrint("🟠 Country: \(country.name)")
        
        return cell
    }
}
