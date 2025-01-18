//
//  Date+Extension.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

extension Date {
    
    func format(with format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: LocalizationName.enUsPosix.rawValue)
        
        return dateFormatter.string(from: self)
    }
}
