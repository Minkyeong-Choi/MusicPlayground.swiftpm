//
//  BeatMakingView.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/5/25.
//

import SwiftUI
import AVFoundation

struct BeatMakingView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var recorder = BeatManager()
    @Binding var fileList: [(inst: String, fileURL: URL)]
    @Binding var totalChannel: Int
    @Binding var path: [String]
    @Binding var isPlusClicked: Bool
    let buttonLabels = ["🥁\nDrum", "👏\nClap", "🥛\nCup", "🚪\nKnocking", "🧊\nShaking Ice", "Perc"]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    recorder.playBeats()
                }) {
                    Image(systemName: "arrowtriangle.right.fill")
                }
                
                Button(action: {
                    recorder.isRecording ? recorder.stopRecording() : recorder.startRecording()
                }) {
                    Image(systemName: recorder.isRecording ?  "square.fill" : "record.circle")
                    
                }
            }
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 300, height: 200)
                        .foregroundStyle(.green)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing:10) {
                        ForEach(0..<6, id: \.self) { index in
                            Button(action: {
                                recorder.audioPlayers[index].play()
                                recorder.recordBeat(index: index)
                            }) {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.orange)
                                    .frame(width: 80, height: 80)
                                    .overlay(Text(buttonLabels[index]).foregroundColor(.white))
                            }
                        }
                    }
                    .frame(width: 300, height: 200)
                    .padding()
                }
                Spacer()
                Button {
                    // store beat data
                    fileList.append((inst: "beat", fileURL: recorder.recordedFileURL))
                    totalChannel += 1
//                    path.removeLast()
                    isPlusClicked = false
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 100)
                        Text("Finish")
                    }
                }
            }
            
            
        }
        
        
        
        
    }
}

//struct beatMakingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BeatMakingView(fileList: .constant([]))
//    }
//}
