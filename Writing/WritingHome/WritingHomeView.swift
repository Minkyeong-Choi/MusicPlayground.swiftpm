//
//  WritingHomeView.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/5/25.
//

import SwiftUI
import AVFoundation

struct WritingHomeView: View {
    @State var totalChannel: Int = 0
    @State var player: AVAudioPlayer? = nil
    @State var duration: TimeInterval = 0
    @State var isPlusClicked: Bool = false
    @Binding var path: [String]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        path.removeAll()
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.green)
                                .frame(width: 80, height: 80)
                            Image(systemName: "music.note.house")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.black)
                        }
                    }
                }
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            // 팝업뷰 띄우기
                            isPlusClicked = true
                            //                        totalChannel += 1
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.gray)
                                    .frame(width: 150, height: 180)
                                Image(systemName: "plus")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                        }
                        
                        ForEach(0..<totalChannel, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.gray)
                                .frame(width: 150, height: 180)
                        }
                    }
                }
                HStack {
                    MusicSliderView(player: player, duration: duration)
                    Spacer()
                    Button {
                        // 완성 버튼
                        // 저장 로직 실행
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.green)
                                .frame(width: 80, height: 80)
                            Image(systemName: "checkmark")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            
            if isPlusClicked {
                InstSelectView(isPlusClicked: $isPlusClicked)
                    
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WritingHomeView(path: .constant([""]))
}
