//
//  QRCodeScannerExampleView.swift
//  QRCode_reader_swiftui_tutorial
//
//  Created by Seokhyun Kim on 2020-10-18.
//
import SwiftUI

struct QRCodeScannerExampleView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?

    var body: some View {

        ZStack {
            if self.scannedCode != nil {
                MyWebview(urlToLoad: self.scannedCode!)
            } else {
                MyWebview(urlToLoad: "https://www.naver.com")
            }
            VStack {
                Spacer()
                Button(action: {
                    self.isPresentingScanner = true

                }){
                    Text("Check number")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth:5)
                        )
                }
                //아래에서 위로 올라오는 뷰
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                //밑에서 30 만큼 띄움.
                Spacer().frame(height: 30)
            }
        }
    }

    var scannerSheet : some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
            QRCodeGuideLineView()
        }
    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
        
    }
}
