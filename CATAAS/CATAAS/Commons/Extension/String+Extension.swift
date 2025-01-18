//
//  String+Extension.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

extension String {
    
    func formattedDate(inputFormat: DateFormat, outputFormat: DateFormat) -> String? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format.rawValue
//        dateFormatter.locale = Locale(identifier: LocalizationName.enUs.rawValue)
//        let date = dateFormatter.date(from: self)
//        
//        return date.string(from: self)
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "EEE MMM dd yyyy HH:mm:ss 'GMT'Z (zzzz)"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM dd yyyy"
        guard let date = inputFormatter.date(from: self) else {
            return nil
        }
        
        return outputFormatter.string(from: date)
    }
}
