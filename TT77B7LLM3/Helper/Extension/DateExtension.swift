//
//  DateExtension.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 16.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
extension Int {
    func dateFormatTime(format:String="dd MMMM yyyy") -> String {
        let newTime = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr")
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 3600 * 3) // gmt 3 için
        return dateFormatter.string(from: newTime)
    }
}
