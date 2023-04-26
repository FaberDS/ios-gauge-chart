//
//  Circular.swift
//  ios_gauge_chart
//
//  Created by Denis Schüle on 26.04.23.
//

import SwiftUI

struct Circular: View {
    
    @State private var value = 0.0
    private let max = 10.0
    private let min = -10.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("AccessoryCircular") {
                    Text("This style displays the gauge’s currentValueLabel value at the center of the gauge. If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear in the opening at the bottom of the ring. Otherwise, the gauge places its label in that location.")
                        .font(.caption)
                    HStack {
                        Gauge(value: value, in: min...max) {
                            Text("Rating")
                                .foregroundColor(.purple)
                                .scaleEffect(0.75)
                        } currentValueLabel: {
                            Text("\(Int(value))")
                                .foregroundColor(.purple)
                        }
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        .tint(.teal)
                        .padding()
                        Gauge(value: value, in: min...max) {
                            Text("Rating")
                                .foregroundColor(.purple)
                                .scaleEffect(0.75)
                        } currentValueLabel: {
                            Text("\(Int(value))")
                                .foregroundColor(.purple)
                        } minimumValueLabel: {
                            Text("\(Int(min))")
                                .foregroundColor(.purple)

                        }maximumValueLabel: {
                            Text("\(Int(max))")
                                .foregroundColor(.purple)

                        }
                        .gaugeStyle(.accessoryCircular)
                        .scaleEffect(1.5)
                        .tint(.teal)
                        .padding()
                    }
                 
                }
                Section("AccessoryCircularCapacity") {
                    Text("This style displays the gauge’s currentValueLabel value at the center of the gauge.")
                        .font(.caption)
                    Gauge(value: value, in: min...max) {
                    } currentValueLabel: {
                        Text("\(Int(value))")
                            .foregroundColor(.red)
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .scaleEffect(1.5)
                    .tint(.red)
                    .padding()
                   
                }
            }
            Spacer()
            Slider(value: $value, in: min...max)

                .navigationTitle("Circular Gauges")
        }
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular()
    }
}
