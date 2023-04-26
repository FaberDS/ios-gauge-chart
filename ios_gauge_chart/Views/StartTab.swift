//
//  ContentView.swift
//  ios_gauge_chart
//
//  Created by Denis Schüle on 26.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BlastOff()
                .tabItem {
                    Label("BlastOff", systemImage: "3.circle.fill")
                }
            Linear()
                .tabItem {
                    Label("Linear Gauges", systemImage: "1.circle.fill")
                }
            Circular()
                .tabItem {
                    Label("Circular Gauges", systemImage: "2.circle.fill")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
