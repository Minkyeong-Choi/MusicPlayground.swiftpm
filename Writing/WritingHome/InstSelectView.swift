//
//  InstSelectView.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/5/25.
//

import SwiftUI

struct InstSelectView: View {
    @Binding var isPlusClicked: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.gray.opacity(0.9))
                .ignoresSafeArea()
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.green)
                    .frame(width: 550, height: 300)
                
                VStack {
                    HStack {
                        Text("What element do you want to add?")
                            .padding(.leading, 20)
                            .font(.title2)
                        Spacer()
                        Button {
                            isPlusClicked = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                        
                    }.frame(width: 550)
                    HStack {
                        NavigationLink(destination: BeatMakingView()){
                            optionView(icon: "🥁", text: "Beat")
                                .padding(.trailing, 20)
                        }
                        
                        NavigationLink(destination: LyricsMakingView()){
                            optionView(icon: "🔠", text: "Lyrics")
                                .padding(.trailing, 20)
                        }
                        
                        NavigationLink(destination: MelodyMakingView()){
                            optionView(icon: "🎶", text: "Melody")
                        }
                    }
                }
            }
        }
    }
    
    private func optionView(icon: String, text: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 150, height: 180)
                .foregroundStyle(.yellow)
            
            VStack {
                Text(icon)
                    .font(.largeTitle)
                Text(text)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    InstSelectView(isPlusClicked: .constant(false))
}
