//
//  NetworkResult.swift
//  PhotoSurfer-iOS
//
//  Created by 양정연 on 2022/07/10.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
