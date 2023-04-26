//
//  BlastOff.swift
//  ios_gauge_chart
//
//  Created by Denis Schüle on 26.04.23.
//

import SwiftUI

struct BlastOff: View {
    @State private var countdown = 10.0
    @State private var start = false
    private let min = 0.0
    private let max = 10.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var rocketOffSet = RocketPlacement.start
    var body: some View {
        NavigationStack{
            Text("Mission Control").font(.largeTitle)
            VStack(spacing: 30) {
                Gauge(value: countdown, in: min...max) {
                    Text(countdown > 0 ? "Count down" : "Blast off")
                        .scaleEffect(0.75)

                } currentValueLabel: {
                    Text("\(Int(countdown))")
                }.gaugeStyle(.accessoryCircular)
                    .scaleEffect(2.0)
                    .tint(Gradient(colors: [.red.opacity(0.4), .red]))
                    .padding(.top)
                
                Button(countdown == 10 ? "Launch" : "Reset") {
                    if countdown == 10 {
                        start = true
                    } else {
                        start = false
                        countdown = 10.0
                        rocketOffSet = RocketPlacement.start
                    }
                }.buttonStyle(.borderedProminent)
                Spacer()
                Image("rocket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .offset(x: rocketOffSet.x, y: rocketOffSet.y)
            }
            .onReceive(timer, perform: { _ in
                if countdown > 0 && start {
                    withAnimation {
                        countdown -= 1
                    }
                } else if countdown == 0 && start {
                    withAnimation(.easeIn(duration: 2.0)) {
                        rocketOffSet = RocketPlacement.end
                    }
                    start = false
                } 
            })
            .navigationTitle("Blast Off")
        }
    }
}

struct BlastOff_Previews: PreviewProvider {
    static var previews: some View {
        BlastOff()
    }
}

enum  RocketPlacement {
    static let start: (x: CGFloat, y: CGFloat) = (
        x:  -UIScreen.main.bounds.size.width / 2 + 5,
        y: 0
    )
    static let end: (x: CGFloat, y: CGFloat) = (
        x: UIScreen.main.bounds.size.width + 100,
        y: -UIScreen.main.bounds.size.height - 500
    )
}
