//
//  ResultUIView.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 15/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import SwiftUI

struct SalaryDetailUiView: View {
    @EnvironmentObject var salaryModel: SalaryModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Čistá mzda:")
                Spacer()
                Text("\(salaryModel.net)")
            }
        }
    }
}

struct SalaryDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        SalaryDetailUiView()
            .environmentObject(SalaryModel())
    }
}
