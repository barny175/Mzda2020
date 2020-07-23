//
//  ResultUIView.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 15/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import SwiftUI

struct SalaryDetailUiView: View {
    @Binding var net: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Čistá mzda:")
                Spacer()
                Text("\(net)")
            }
        }
    }
}

struct SalaryDetailUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        SalaryDetailUiView(net: .constant(20000))
    }
}
