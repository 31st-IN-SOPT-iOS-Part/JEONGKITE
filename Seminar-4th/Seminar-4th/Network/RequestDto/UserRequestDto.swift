//
//  UserRequestDto.swift
//  Seminar-4th
//
//  Created by 양정연 on 2022/11/05.
//

import Foundation

// MARK: - SignupRequestDto

struct SignupRequestDto: Codable {
    var email: String
    var name: String
    var password: String
}

// MARK: - LoginRequestDto

struct LoginRequestDto: Codable {
    var email: String
    var password: String
}
