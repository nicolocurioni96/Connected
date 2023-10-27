//
//  CountryListController.swift
//  Connected
//
//  Created by Nicolò Curioni on 24/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import UIKit

class CountryListController: UITableViewController {
    // MARK: - View Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Connected"
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
