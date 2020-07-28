//
//  Invalidita.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 28/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import Foundation

enum Invalidita: String, CaseIterable, Identifiable {
    case žádná
    case částečná
    case plná
    
    var id: String { self.rawValue }
}
