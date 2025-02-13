//
//  BeatManager.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/12/25.
//

import SwiftUI
import AVFoundation

struct BeatEvent: Codable {
    let index: Int     // 눌린 버튼 인덱스 (0~5)
    let timestamp: TimeInterval // 버튼을 누른 시간 (초)
}

class BeatManager: ObservableObject {
    @Published var isRecording = false
    @Published var beats: [BeatEvent] = []
    @Published var audioPlayers: [AVAudioPlayer] = []
    @Published var recordedFileURL: URL = URL(fileURLWithPath: "")
    @Published var isStoreFinished: Bool = true
    private var audioRecorder: AVAudioRecorder?
    
    private var startTime: TimeInterval?
//    var recordedFileURL: URL? // 저장된 파일 url
    
    init() {
        loadSounds()
    }
    
    // 1. sound 불러오기
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
        isStoreFinished = false
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
        
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            // AVAudioRecorder 초기화 및 설정
            audioRecorder = try AVAudioRecorder(url: fileURL, settings: settings)
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            
            print("비트 녹음 시작!")
            
            // 입력된 비트 이벤트를 기반으로 사운드 재생 및 녹음
            for beat in beats {
                DispatchQueue.main.asyncAfter(deadline: .now() + beat.timestamp) {
                    self.audioPlayers[beat.index].play()
                }
            }
            
            // 일정 시간 후 녹음 종료
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { // 5초 후 저장
                self.audioRecorder?.stop()
                self.recordedFileURL = fileURL
                self.isStoreFinished = true
                
                print("비트 녹음 저장 완료! 위치: \(self.recordedFileURL)")
            }
        } catch {
            print("비트 녹음 저장 실패: \(error.localizedDescription)")
        }
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
