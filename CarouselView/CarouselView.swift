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
    @State private var activeIndex: Int = 0
    
    var views: [CarouselViewHelper] = placeholderCarouselViewHelper
    
    var xDistance: Int = 150
    
    var body: some View {
        
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0 - abs(distance(view.id)) * 0.3)
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged({ value in
                    draggingItem = snappedItem + value.translation.width / 100
                })
                .onEnded({ value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
                        snappedItem = draggingItem
                        self.activeIndex = views.count + Int(draggingItem)
                        if self.activeIndex > views.count || Int(draggingItem) >= 0{
                            self.activeIndex = Int(draggingItem)
                        }
                        
                    }
                })
        )
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

var placeholderCarouselViewHelper: [CarouselViewHelper] = [
    
    CarouselViewHelper(id: 1, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
            
            Text("1")
                .padding()
        }
        .frame(width: 300, height: 500)
    }),
    
    CarouselViewHelper(id: 1, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
            
            Text("2")
                .padding()
        }
        .frame(width: 300, height: 500)
    }),
    
    CarouselViewHelper(id: 3, content: {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
            
            Text("3")
                .padding()
        }
        .frame(width: 300, height: 500)
    })
]

