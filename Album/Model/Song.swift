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
    var fileUUID: String
    var createdAt: Date

    init(color: String, fileName: String, fileUUID: String, createdAt: Date) {
        self.id = UUID()
        self.color = color
        self.fileName = fileName
        self.fileUUID = fileUUID
        self.createdAt = createdAt
    }
}

