//
//  Linear.swift
//  ios_gauge_chart
//
//  Created by Denis Schüle on 26.04.23.
//

import SwiftUI

struct Linear: View {
    
    @State private var value = 20.0
    private let max = 50.0
    private let min = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Linear Capacity") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. The label appears above the gauge, and the currentValueLabel appears below.")
                        .font(.caption)
                    Gauge(value: 0.2){
                        Text("Rating")
                    }.tint(.red)
                    Gauge(value: value, in: min...max) {
                        Text("Rating")
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(min))")
                    } maximumValueLabel: {
                        Text("\(Int(max))")
                    }
                    .tint(ImagePaint(image:Image("star")))
                }
                Section("AccessoryLinear") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. Otherwise, the gauge displays the currentValueLabel value on the leading edge.")
                        .font(.caption)
        
                    Gauge(value: value, in: min...max) {
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(min))")
                    } maximumValueLabel: {
                        Text("\(Int(max))")
                    }.tint(Gradient(colors: [.blue,.green,.yellow,.orange,.red]))
                        .gaugeStyle(.accessoryLinear)
                    
                }
                Section("AccessoryLinearCapacity") {
                    Text("If you provide minimumValueLabel and maximumValueLabel parameters when you create the gauge, they appear on leading and trailing edges of the bar, respectively. The label appears above the gauge, and the currentValueLabel appears below.")
                        .font(.caption)
                    Gauge(value: value, in: min...max) {
                        Text("Temperature")
                    } currentValueLabel: {
                        Text("\(Int(value))")
                    } minimumValueLabel: {
                        Text("\(Int(min))")
                    } maximumValueLabel: {
                        Text("\(Int(max))")
                    }.tint(.red)
                        .gaugeStyle(.accessoryLinearCapacity)
                }
            }
            Spacer()
            Slider(value: $value, in: min...max)

                .navigationTitle("Linear Gauges")

            
        }
    }
}

struct Linear_Previews: PreviewProvider {
    static var previews: some View {
        Linear()
    }
}
