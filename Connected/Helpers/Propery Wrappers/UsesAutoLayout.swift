//
//  UsesAutoLayout.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import UIKit

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
