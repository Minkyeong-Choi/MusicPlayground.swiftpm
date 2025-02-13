//
//  Song.swift
//  MusicWriting
//
//  Created by Choi Minkyeong on 2/4/25.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
class Song {
    var id: UUID
    var color: String
    var fileName: String
    var fileURL: URL
    var fileUUID: String
    var createdAt: Date

    init(color: String, fileName: String, fileURL: URL, fileUUID: String, createdAt: Date) {
        self.id = UUID()
        self.color = color
        self.fileName = fileName
        self.fileURL = fileURL
        self.fileUUID = fileUUID
        self.createdAt = createdAt
    }
}

