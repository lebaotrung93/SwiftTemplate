//
//  DataExtension.swift
//  2WP
//
//  Created by Le Bao Trung on 4/22/20.
//  Copyright © 2020 Sum Pham. All rights reserved.
//

import Foundation

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
