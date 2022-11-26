//
//  MusicService.swift
//  Seminar-4th
//
//  Created by 양정연 on 2022/11/19.
//

import Foundation

import Moya

public class MusicService {
    static let shared = MusicService()
    let musicProvider = MoyaProvider<MusicRouter>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    public init() { }
    
    
//    func fetchSongs(completion: @escaping (NetworkResult<Any>) -> Void) {
//        musicProvider.request(.fetchSongs) { result in
//            switch result {
//            case .success(let response):
//                let statusCode = response.statusCode
//                let data = response.data
//                let networkResult = NetworkBase.judgeStatus(by: statusCode, data, MusicResponseDto.self)
//                completion(networkResult)
//            case .failure(let err):
//                print(err)
//            }
//        }
//    }
}
