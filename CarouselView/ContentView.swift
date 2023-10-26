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
            CarouselView()
        }
        .background(Color.gray)
    }
    
    func getHelperView() -> [CarouselViewHelper] {
        var tempViews: [CarouselViewHelper] = []
        
        for i in (1...4) {
            tempViews.append(CarouselViewHelper(id: 1, content: {
                ZStack {
                    Image("\(i)")
                }
            }))
        }
        
        return tempViews
    }
}

#Preview {
    ContentView()
}
