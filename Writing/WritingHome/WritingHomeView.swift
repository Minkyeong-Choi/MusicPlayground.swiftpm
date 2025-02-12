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
//    @State var fileList: (inst: String, fileURL: URL)  = ("", URL(fileURLWithPath: ""))
    @State var fileList: [(inst: String, fileURL: URL)]  = []
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
//                            path.append("InstSelectView")
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
                        
                        ForEach(0..<fileList.count, id: \.self) { index in
                            if fileList[index].inst == "beat" {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.gray)
                                        .frame(width: 150, height: 180)
                                    VStack {
                                        Text("🥁")
                                        Text("Beat")
                                        HStack {
                                            Button {
                                                playRecordedFile(recordedFileURL: fileList[index].fileURL)
                                            } label: {
                                                Image(systemName: "arrowtriangle.right.fill")
                                            }
                                            Button {
                                                fileList.remove(at: index)
                                            } label: {
                                                Image(systemName: "xmark")
                                            }
                                        }
                                    }
                                }
                            } else if fileList[index].inst == "melody" {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.gray)
                                        .frame(width: 150, height: 180)
                                    VStack {
                                        Text("🎶")
                                        Text("Melody")
                                        HStack {
                                            Image(systemName: "arrowtriangle.right.fill")
                                            Image(systemName: "xmark")
                                        }
                                    }
                                }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(.gray)
                                        .frame(width: 150, height: 180)
                                    VStack {
                                        Text("🔠")
                                        Text("Lyrics")
                                        HStack {
                                            Image(systemName: "arrowtriangle.right.fill")
                                            Image(systemName: "xmark")
                                        }
                                    }
                                }
                            }
                            
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
                InstSelectView(isPlusClicked: $isPlusClicked, fileList: $fileList, totalChannel: $totalChannel, path: $path)
                    
            }
        }
//        .navigationDestination(for: String.self) { value in
//                    switch value {
//                    case "InstSelectView":
//                        InstSelectView(isPlusClicked: $isPlusClicked, fileList: $fileList, totalChannel: $totalChannel, path: $path)
//                    default:
//                        EmptyView()
//                    }
//                }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WritingHomeView(path: .constant([""]))
}
