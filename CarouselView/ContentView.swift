//  /*
//
//  Project: CarouselView
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 25.10.2023
//
//  */

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            CarouselView(views: getHelperView())
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
    }
    
    func getHelperView() -> [CarouselViewHelper] {
        var tempViews: [CarouselViewHelper] = []
        
        for i in (1...4) {
            tempViews.append(CarouselViewHelper(id: i, content: {
                ZStack {
                    Image("\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 300, height: 500)
                        }
                }
                .frame(width: 300, height: 500)
                .shadow(radius: 15)
            }))
        }
        return tempViews
    }
}

#Preview {
    ContentView()
}
