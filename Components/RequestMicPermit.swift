//
//  RequestMicPermit.swift
//  MusicPlayground
//
//  Created by Choi Minkyeong on 2/13/25.
//

import AVFoundation

func requestMicrophonePermissionIfNeeded() {
    let session = AVAudioSession.sharedInstance()
    session.requestRecordPermission { granted in
        if granted {
            print("마이크 사용 허용됨")
        } else {
            print("마이크 사용 거부됨")
        }
    }
    
    do {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(.playback, mode: .default, options: [])
        try audioSession.setActive(true)
        print("🎵 오디오 세션 설정 완료")
    } catch {
        print("❌ 오디오 세션 설정 실패: \(error.localizedDescription)")
    }

}
