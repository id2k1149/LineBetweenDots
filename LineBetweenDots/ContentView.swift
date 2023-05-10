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
            Text("Offset by passing horizontal")
                .border(Color.green)
                .offset(x: 20, y: 50)
                .border(Color.gray)
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .offset(x: -100, y: 0)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .offset(x: 100, y: 0)
                if isConnecting {
                    TrimmedPath(from: CGPoint(x: 100, y: 300),
                                to: CGPoint(x: 275, y: 300),
                                trimAmount: 0.5)
                        .stroke(Color.red, lineWidth: 5)
                        .animation(.easeInOut(duration: 100))
//                        .onAppear {
//                            withAnimation(.easeInOut(duration: 1)) {
//                                self.isConnecting = true
//                            }
//                        }
                }
            }
            Spacer()
            Button("Connect") {
                isConnecting.toggle()
            }
        }
    }
}

struct TrimmedPath: Shape {
    var from: CGPoint
    var to: CGPoint
    var trimAmount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: from)
        path.addLine(to: CGPoint(x: from.x + (to.x - from.x) * trimAmount,
                                 y: from.y + (to.y - from.y) * trimAmount))
        return path
    }
    
    var animatableData: CGFloat {
        get { trimAmount }
        set { trimAmount = newValue }
    }
}

extension Animation {
    func onAnimationCompleted(for value: Bool) -> Animation {
        value ? self : self.delay(0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
