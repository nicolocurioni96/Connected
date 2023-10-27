//
//  CountryViewCell.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import UIKit

final class CountryViewCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "CountryCell"
    
    @UsesAutoLayout
    var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.tintColor = .black
        return label
    }()

    // MARK: - View Life-cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.addSubview(countryNameLabel)
        
        NSLayoutConstraint.activate([
            countryNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countryNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
