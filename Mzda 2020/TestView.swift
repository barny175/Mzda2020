//
//  TestView.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 24/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import SwiftUI

struct TestView: View {
    @State private var text: String = "0"
    private var resultString: String {
        if let num = Int(self.text) {
            return String(num*num)
        }
        return "0"
    }
    var body: some View {
        VStack {
            VStack(alignment:.leading) {
                Text("Input number as String")
                TextField("String Number",text: self.$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            Text("From String")
            Text("Square of \(self.text) is \(self.resultString)") .font(.title)
            Spacer()
        }.padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
