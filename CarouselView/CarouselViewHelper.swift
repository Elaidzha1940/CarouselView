//  /*
//
//  Project: CarouselView
//  File: CarouselViewHelper.swift
//  Created by: Elaidzha Shchukin
//  Date: 25.10.2023
//
//  */

import SwiftUI

struct CarouselViewHelper: View, Identifiable {
    var id: Int
    @ViewBuilder var content: any View
    
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}

