//
//  MusicSliderView.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/5/25.
//

import AVFoundation
import SwiftUI

struct MusicSliderView: View {
    @State var isPlaying = false
    @State var currentTime: TimeInterval = 0
    
    var player: AVAudioPlayer?
    var duration: TimeInterval
    
    var body: some View {
        Button(action: {
            if isPlaying {
                player?.pause()
            } else {
                player?.play()
            }
            isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.black)
                .padding()
        }
        Slider(value: $currentTime, in: 0...duration, onEditingChanged: { isDragging in
            if !isDragging {
                player?.currentTime = currentTime
            }
        })
        .accentColor(.blue)
    }
}


/*
 import SwiftUI
 import AVFoundation

 struct MusicPlayerView: View {
     @State private var player: AVAudioPlayer?
     @State private var isPlaying = false
     @State private var currentTime: TimeInterval = 0
     @State private var duration: TimeInterval = 1
     
     var body: some View {
         VStack(spacing: 20) {
             // 음악 진행도 슬라이더
             Slider(value: $currentTime, in: 0...duration, onEditingChanged: { isDragging in
                 if !isDragging {
                     player?.currentTime = currentTime
                 }
             })
             .accentColor(.blue)
             
             // 현재 시간 / 총 재생 시간
             HStack {
                 Text(formatTime(currentTime))
                 Spacer()
                 Text(formatTime(duration))
             }
             .font(.caption)
             .foregroundColor(.gray)
             
             // 재생/일시정지 버튼
             Button(action: {
                 if isPlaying {
                     player?.pause()
                 } else {
                     player?.play()
                 }
                 isPlaying.toggle()
             }) {
                 Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                     .resizable()
                     .frame(width: 50, height: 50)
                     .foregroundColor(.white)
                     .padding()
                     .background(Circle().fill(Color.blue))
             }
         }
         .padding()
         .onAppear {
             setupPlayer()
         }
     }
     
     // 오디오 플레이어 설정
     func setupPlayer() {
         if let url = Bundle.main.url(forResource: "music", withExtension: "mp3") {
             do {
                 player = try AVAudioPlayer(contentsOf: url)
                 duration = player?.duration ?? 1
                 Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                     if let player = player {
                         currentTime = player.currentTime
                     }
                 }
             } catch {
                 print("오디오 파일을 로드할 수 없습니다.")
             }
         }
     }

     // 시간을 mm:ss 형식으로 변환
     func formatTime(_ time: TimeInterval) -> String {
         let minutes = Int(time) / 60
         let seconds = Int(time) % 60
         return String(format: "%02d:%02d", minutes, seconds)
     }
 }

 */
