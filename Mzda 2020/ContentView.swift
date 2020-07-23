//
//  ContentView.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 13/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var net: Int = 0
    @State var sleva = true
    @State var children = 0
    @State var gross = 30000
    
    var body: some View {
        VStack {
            Text("Mzda 2020")
                .font(.title)
            Stepper(onIncrement: {
                    self.gross += 1000
                },
                onDecrement: {
                    self.gross -= 1000
                    if self.gross < 0 {
                        self.gross = 0
                    }
                },
                label: {
                    Text("Hrubá mzda: \(gross)")
                }
            )
            Toggle(isOn: $sleva) {
                Text("Sleva na poplatníka:")
            }
            Stepper(value: $children, in: 0...10) {
                Text("Dětí: \(children)")
            }
            Button(action: {
                self.net = SalaryCalculator()
                    .netSalary(gross: self.gross,
                               pocetDeti: self.children,
                               sleva: self.sleva)
            }) {
                Text("Spočítej")
            }
            Divider()
            SalaryDetailUiView(net: $net)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
