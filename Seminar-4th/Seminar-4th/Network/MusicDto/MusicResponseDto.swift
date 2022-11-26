//
//  MusicResponseDto.swift
//  Seminar-4th
//
//  Created by 양정연 on 2022/11/19.
//

import Foundation

struct FetchMusicResponseDto: Codable {
    let statusCode: Int
    let success: Bool
    let message: String
    let data: [MusicResponseDto]
}

struct MusicResponseDto: Codable {
    let id: Int
    let image: String
    let title, singer: String
    
    func convertToMusic() -> MusicModel {
        return MusicModel(albumImage: self.image, title: self.title, singer: self.singer)
    }
}
