//
//  HomeView.swift
//  MusicWritings
//
//  Created by Choi Minkyeong on 2/5/25.
//

import SwiftUI

struct HomeView: View {
    @State var path: [String] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button {
                    path.append("WritingHomeView")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.gray)
                            .frame(width: 350, height: 150)
                        Text("Make a song")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .bold()
                    }
                }
                
                Button {
                    path.append("AlbumView") // path 배열에 값을 추가하여 이동
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.gray)
                            .frame(width: 350, height: 150)
                        Text("Music Box")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .bold()
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                            switch value {
                            case "WritingHomeView":
                                WritingHomeView(path: $path)
                            case "AlbumView":
                                AlbumView(path: $path)
                            default:
                                EmptyView()
                            }
                        }
        }
    }
}
