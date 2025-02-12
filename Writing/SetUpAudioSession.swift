
//
//  SetUpAudioSession.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/13/25.
//

import AVFoundation

func setupAudioSession() {
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        try AVAudioSession.sharedInstance().setActive(true)
        print("✅ 오디오 세션 설정 완료")
    } catch {
        print("❌ 오디오 세션 설정 실패: \(error.localizedDescription)")
    }
}
