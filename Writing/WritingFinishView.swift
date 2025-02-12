//
//  WritingFinishView.swift
//  MusicWriting
//
//  Created by Choi Minkyeong on 2/4/25.
//


// 1. 레코딩이 끝났을 때 오디오 파일 저장 경로 설정
/*
func getDocumentsDirectory() -> URL {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
}
 
 func saveNewRecording(audioData: Data, modelContext: ModelContext, color: String, fileName: String, fileUUID: String, createdAt: Date) {
     let fileName = generateFileName() // ✅ 새로운 파일명 생성
     if let fileURL = savedURL(fileName: fileName, audioData: audioData) {
         let newRecording = Song(color: color, fileName: fileName, fileUUID: fileUUID, createdAt: createdAt)
         modelContext.insert(newRecording)
         try? modelContext.save()
         print("Recording saved at: \(fileURL)")
     } else {
         print("Failed to save recording.")
     }
 }
 
 func generateFileName() -> String {
     return "\(UUID().uuidString).m4a"
 }
 
 func savedURL(fileName: String, audioData: Data) -> URL? {
     let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
     do {
         try audioData.write(to: fileURL)
         return fileURL
     } catch {
         print("Failed to save audio: \(error)")
         return nil
     }
 }
*/
