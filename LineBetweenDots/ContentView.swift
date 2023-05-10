//
//  ContentView.swift
//  LineBetweenDots
//
//  Created by Max Franz Immelmann on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isConnecting = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 20, height: 20)
                    .offset(x: -100, y : 0)
                Circle()
                    .fill(Color.green)
                    .frame(width: 20, height: 20)
                    .offset(x: 100, y: 0)
                Path { path in
                    path.move(to: CGPoint(x: 102, y: 363))
                    path.addLine(to: CGPoint(x: 288, y: 363))
                }
                .stroke(Color.red, lineWidth: 5)
                .opacity(isConnecting ? 1 : 0)
                .animation(.easeInOut(duration: 5))
            }
            Spacer()
            Button("Connect") {
                isConnecting.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
