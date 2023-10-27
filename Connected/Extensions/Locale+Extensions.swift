//
//  Locale+Extensions.swift
//  Connected
//
//  Created by nicolocurioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation

extension Locale {
    static var backendDefault: Locale {
        Locale(identifier: "en")
    }
    
    var shortIdentifier: String {
        String(identifier.prefix(2))
    }
}
