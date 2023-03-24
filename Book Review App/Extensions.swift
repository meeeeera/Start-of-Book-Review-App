//
//  Extensions.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 14.03.2023.
//

import Foundation
import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}
