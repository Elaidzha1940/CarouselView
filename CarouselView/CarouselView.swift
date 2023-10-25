//  /*
//
//  Project: CarouselView
//  File: CarouselView.swift
//  Created by: Elaidzha Shchukin
//  Date: 25.10.2023
//
//  */

import SwiftUI

struct CarouselView : View {
    @State private var snappedItem = 0.0
    @State private var draggingItem = 1.0
    @State private var avtiveIndex: Int = 0
    
    var views: [CarouselViewHelper]
    
    var xDistance: Int = 150
    
    var body: some View {
        
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0 - abs(distance(view.id)) * 0.3)
                    .offset(x: getOffset(), y: 0)
            }
        }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
    }
    
    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        return sin(angle) * Double(xDistance)
    }
}

#Preview {
    CarouselView()
}
