//
//  ContentView.swift
//  SwiftUIGridLayout
//
//  Created by Tomas Havlicek on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    var body: some View {
        VerticalGrid(symbols: symbols, colors: colors)
//        HorizontalGrid(symbols: symbols, colors: colors)
    }
}

struct VerticalGrid: View {
    
    var symbols: [String]
    var colors: [Color]
    
//    var gridItemLayout = [
//        GridItem(.flexible(), spacing: 20),
//        GridItem(.flexible(), spacing: 20),
//        GridItem(.flexible(), spacing: 20)]
    
//    var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
        
    //.adaptive displays as many items as possible in a row
//    var gridItemLayout = [GridItem(.adaptive(minimum: 50))]
    
//    var gridItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(150))]
    
    var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50 ))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct HorizontalGrid: View {
    
    var symbols: [String]
    var colors: [Color]
    
    var gridItemLayout = [GridItem(.fixed(150)), GridItem(.adaptive(minimum: 50 ))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 20) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
