//
//  PlayRecordedFile.swift
//  MusicPlayground
//
//  Created by Choi Minkyeong on 2/13/25.
//

import SwiftUI
import AVFoundation
//import AVKit

class AudioFunctions {
    var audioPlayer: AVAudioPlayer?
    
//    @MainActor
//    func loadBeatsFromFile(url: URL) {
//        var beats: [BeatEvent] = []
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            beats = try decoder.decode([BeatEvent].self, from: data) // JSON을 다시 비트 이벤트 배열로 변환
//            print("비트 데이터 불러오기 성공: \(url)")
//        } catch {
//            print("비트 데이터 불러오기 실패: \(error.localizedDescription)")
//        }
//    }

//    @MainActor
    func playRecordedFile(recordedFileURL: URL?) {
        guard let recordedFileURL else {
            print("저장된 파일이 없습니다.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recordedFileURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            print("저장된 비트 파일 재생 중: \(recordedFileURL)")
        } catch {
            print("녹음된 비트 파일 재생 실패: \(error.localizedDescription)")
        }
    }

    func isValidM4AFile(url: URL) -> Bool {
        guard let fileType = try? url.resourceValues(forKeys: [.typeIdentifierKey]).typeIdentifier else {
            return false
        }
        
        return fileType == "public.mpeg-4"
    }

}

