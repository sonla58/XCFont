//
//  ContentView.swift
//  CustomFontDemo
//
//  Created by finos.son.le on 31/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    let fonts = FontName.allCases
    let sizes = Array(10...50)
    @State private var selectedFont: FontName
    @State private var size: Float = 20
    
    init() {
        _selectedFont = State(initialValue: fonts[0])
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                Spacer()
                
                Text("Hello, world!")
                    .font(selectedFont.asFont(size: CGFloat(size)))
                    .padding()
                Spacer()
                
                Picker("Choose font", selection: $selectedFont) {
                    ForEach(fonts, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding()
                
                Slider(value: $size, in: 10...64)
                    .padding()
                
                Spacer()
            }
            .frame(width: proxy.size.width)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
