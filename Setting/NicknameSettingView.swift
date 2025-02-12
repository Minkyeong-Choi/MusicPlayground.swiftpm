//
//  NicknameSettingView.swift
//  MusicWriting
//
//  Created by Choi Minkyeong on 2/4/25.
//

import SwiftUI

struct NicknameSettingView: View {
//    @State var name: String = UserDefaults.standard.string(forKey: "userName") ?? ""
    @State var name: String = ""
    @State var goNext: Bool = false
    
    var body: some View {
        ZStack {
//            BackgroundImageView
            HStack {
                TextField("name", text: $name)
                    .modifier(LoginTextFieldModifier(width: 300, height: 70))
                Spacer()
                Button {
                    goNext = true
                } label: {
                    Circle()
                        .foregroundStyle(.gray)
                        .frame(width: 70, height: 70)
                }
            }
            if goNext {
                // 다음 페이지로 넘어가기
            }
        }
    }
}

//struct BackgroundImageView: View {
//    var image: UIImage
//
//    var body: some View {
//        GeometryReader { geometry in
//            Image(uiImage: image)
//                .resizable()
//                .scaledToFill() // 기기의 화면 비율에 맞게 이미지 확대
//                .frame(width: geometry.size.width, height: geometry.size.height)
//                .ignoresSafeArea() // 상태바 영역까지 꽉 차게 설정
//        }
//    }
//}

struct LoginTextFieldModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .padding()
            .frame(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .foregroundColor(.gray)
                    .frame(width: width, height: height)
            }
    }
}


//UserDefaults.standard.set("hohyeon", forKey: "userName")
#Preview {
    NicknameSettingView()
}
