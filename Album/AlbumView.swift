//
//  AlbumView.swift
//  MusicWriting
//
//  Created by Choi Minkyeong on 2/4/25.
//

import SwiftUI

struct AlbumView: View {
    @Binding var path: [String]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    path.removeAll()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.green)
                            .frame(width: 80, height: 80)
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
            }
            Text("AlbumView")
            
        }
        .navigationBarBackButtonHidden()
    }
}

// how to import recorded file?
/*
 func loadRecording(fileName: String) -> URL? {
     let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
     return FileManager.default.fileExists(atPath: fileURL.path) ? fileURL : nil
 }

 func deleteRecording(fileName: String, modelContext: ModelContext, recording: Recording) {
     let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
     do {
         try FileManager.default.removeItem(at: fileURL)
         modelContext.delete(recording)
         try? modelContext.save()
     } catch {
         print("Failed to delete audio file: \(error)")
     }
 }

 */
