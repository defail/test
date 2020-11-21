//
//  StringExtension.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import Foundation

extension String {
    func formatUrl() -> String {
        guard let data = self.data(using: .utf8) else {
            return ""
        }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return ""
        }
        return attributedString.string
    }
}
