//
//  DateExtension.swift
//  TestAronov
//
//  Created by defail on 11/22/20.
//

import Foundation

extension Date {
    
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: date).hour ?? 0
    }
}
