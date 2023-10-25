//  /*
//
//  Project: CarouselView
//  File: CarouselView.swift
//  Created by: Elaidzha Shchukin
//  Date: 25.10.2023
//
//  */

import SwiftUI

struct CarouselView: View {
    @State private var snappedItem = 0.0
    @State private var dragging = 1.0
    @State private var avtiveIndex: Int = 0
    
    var views: [CarouselViewHelper]
    
    var body: some View {
        
        ZStack {
            ForEach(views) { view in
                
            }
        }
    }
}

#Preview {
    CarouselView()
}
