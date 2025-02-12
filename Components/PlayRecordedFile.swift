//
//  PlayRecordedFile.swift
//  MusicPlayground
//
//  Created by Choi Minkyeong on 2/13/25.
//

import SwiftUI
import AVFoundation

func playRecordedFile(recordedFileURL: URL?) {
    guard let recordedFileURL else {
        print("저장된 파일이 없습니다.")
        return
    }
    
    do {
        let player = try AVAudioPlayer(contentsOf: recordedFileURL)
        player.prepareToPlay()
        player.play()
        print("저장된 비트 파일 재생 중: \(recordedFileURL)")
    } catch {
        print("녹음된 비트 파일 재생 실패: \(error.localizedDescription)")
    }
}

