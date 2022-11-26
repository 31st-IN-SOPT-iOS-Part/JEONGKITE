//
//  Environment.swift
//  Seminar-4th
//
//  Created by 양정연 on 2022/11/05.
//

import Foundation

// MARK: - Environment

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
