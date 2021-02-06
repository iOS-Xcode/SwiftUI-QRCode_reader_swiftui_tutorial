//
//  MyWebview.swift
//  QRCode_reader_swiftui_tutorial
//
//  Created by Seokhyun Kim on 2020-10-18.
//

import SwiftUI
import WebKit
//uikit의 uiview를 사용할 있도록 한다.
//controller를 사용 할 경우 UIViewControllerRepresentable
struct MyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    // uiView 만들기
    func makeUIView(context: Context) -> WKWebView {
        //unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webview = WKWebView()
        //웹뷰 로드
        webview.load(URLRequest(url: url))
        return webview
    }
    
    //update ui view, 다시 그림
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
        
    }
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}

