//
//  QRCodeGuideLineView.swift
//  QRCode_reader_swiftui_tutorial
//
//  Created by Seokhyun Kim on 2020-10-18.
//

import SwiftUI

struct QRCodeGuideLineView : View {
    var body: some View {
        GeometryReader{geometry in
            RoundedRectangle(cornerRadius: 20).stroke(style: StrokeStyle(lineWidth: 10, dash: [11]))
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
                .foregroundColor(.yellow)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}
