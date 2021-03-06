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
    @State var student = false
    @State var prukazZtp = false
    @State var children = 0
    @State var invalidity = Invalidita.žádná
    @State var gross: String
    private var grossF: Double {
        get {
            if let x = Double(gross) {
                return x
            }
            return 0.0
        }
        set(val) {
            gross = "\(val)"
        }
    }
    
    var body: some View {
        VStack {
            Group {
                Text("Mzda 2020")
                    .font(.title)
                HStack {
                    Text("Hrubá mzda: ")
                    Spacer()
                    TextField("0", text: $gross)
                        .keyboardType(.numberPad)
                }
    //            Slider(value: $grossF, in: 0.0...139000.0, step: 1000.0)
                
                Toggle(isOn: $sleva) {
                    Text("Sleva na poplatníka:")
                }

                Toggle(isOn: $student) {
                    Text("Student:")
                }

                Toggle(isOn: $prukazZtp) {
                    Text("ZTP:")
                }
                
                Text("Invalidita:")
                Picker("Invalidita", selection: $invalidity) {
                    ForEach (Invalidita.allCases) {stupen in
                        Text(stupen.rawValue).tag(stupen)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Stepper(value: $children, in: 0...10) {
                    Text("Dětí: \(children)")
                }
                
                Button(action: {
                    self.net = SalaryCalculator()
                        .netSalary(grossSalary: Int(self.grossF),
                                   pocetDeti: self.children,
                                   sleva: self.sleva,
                                   invalidita: self.invalidity,
                                   student: self.student,
                                   ztp: self.prukazZtp)
                }) {
                    Text("Spočítej")
                }
            }
            Divider()
            SalaryDetailUiView(net: $net)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gross: "0")
    }
}
