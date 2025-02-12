//
//  BeatManager.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/12/25.
//

import SwiftUI
import AVFoundation

struct BeatEvent {
    let index: Int     // 눌린 버튼 인덱스 (0~5)
    let timestamp: TimeInterval // 버튼을 누른 시간 (초)
}

class BeatManager: ObservableObject {
    @Published var isRecording = false
    @Published var beats: [BeatEvent] = []
    @Published var audioPlayers: [AVAudioPlayer] = []
    @Published var recordedFileURL: URL = URL(fileURLWithPath: "")
    private var audioRecorder: AVAudioRecorder?
    
    private var startTime: TimeInterval?
//    var recordedFileURL: URL? // 저장된 파일 url
    
    init() {
        loadSounds()
    }
    
    private func loadSounds() {
        print("initializer loaded,")
        let soundNames = ["kick", "snare", "hihat", "clap", "knock", "ice"]
        for name in soundNames {
            if let url = Bundle.main.url(forResource: name, withExtension: "m4a") {
                do {
                    let player = try AVAudioPlayer(contentsOf: url)
                    player.prepareToPlay()
                    audioPlayers.append(player)
                } catch {
                    print("Failed to load \(name): \(error.localizedDescription)")
                }
            }
        }
    }
    
    func startRecording() {
        beats.removeAll()
        startTime = Date().timeIntervalSince1970
        isRecording = true
    }
    
    @MainActor func stopRecording() {
        isRecording = false
        saveBeatsToFile()
    }
    
    func recordBeat(index: Int) {
        guard isRecording, let startTime else { return }
                
                let timestamp = Date().timeIntervalSince1970 - startTime
                beats.append(BeatEvent(index: index, timestamp: timestamp))
                
                // 버튼 누르면 사운드 재생
                audioPlayers[index].play()
    }
    
    @MainActor
    func saveBeatsToFile() {
            let fileName = "BeatTrack-\(UUID().uuidString).m4a"
            let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        DispatchQueue.main.async {
            self.recordedFileURL = fileURL // 저장된 파일 URL 업데이트
            }
        // 비트 데이터를 파일로 변환하는 로직 (추후 구현)
            print("비트 녹음 저장 완료! 위치: \(fileURL)")
        }
    
    // MARK: - 문서 폴더 경로 가져오기
        private func getDocumentsDirectory() -> URL {
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
    
    @MainActor
        func playBeats() {
            guard !beats.isEmpty else { return }
            
            for beat in beats {
                DispatchQueue.main.asyncAfter(deadline: .now() + beat.timestamp) {
                    self.audioPlayers[beat.index].play()
                }
            }
        }
}
