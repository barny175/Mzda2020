//
//  SalaryCalculator.swift
//  Mzda 2020
//
//  Created by Martin Barnas on 19/07/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import Foundation

let zdravotni: Double = 0.09
let socialni: Double = 0.248
let slevaNaPoplatnika = 2070

class SalaryCalculator {

    let slevyNaDeti = [1267, 1617, 2017]
    
    fileprivate func slevaNaDeti(_ pocetDeti: Int) -> Int {
        var sleva = 0
        for k in 0..<pocetDeti {
            sleva += slevyNaDeti[k < slevyNaDeti.count ? k : slevyNaDeti.count - 1]
        }
        return sleva
    }
    
    func netSalary(gross: Int, pocetDeti: Int, sleva: Bool) -> Int {
        let superhruba = (zdravotni + socialni + 1) * Double(gross)
        let zaokrouhlene = (superhruba/100).rounded(.up) * 100
        let zalohaNaDan = zaokrouhlene * 0.15
        let zdravotniASocialni = Double(gross) * (0.045 + 0.065)
        
        var zalohaPoSleve = Int(zalohaNaDan) - slevaNaDeti(pocetDeti)
        if sleva {
            zalohaPoSleve -= slevaNaPoplatnika
        }
        return gross - Int(zdravotniASocialni) - zalohaPoSleve
    }
}

