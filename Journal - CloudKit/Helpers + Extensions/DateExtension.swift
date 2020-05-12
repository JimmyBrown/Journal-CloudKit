//
//  DateExtension.swift
//  Journal - CloudKit
//
//  Created by Jimmy on 5/11/20.
//  Copyright © 2020 Jimmy. All rights reserved.
//

import Foundation

extension Date {
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
