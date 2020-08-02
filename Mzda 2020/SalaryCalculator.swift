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
    
    func netSalary(gross: Int, pocetDeti: Int, sleva: Bool, invalidita: Invalidita, student: Bool) -> Int {
        let superhruba = (zdravotni + socialni + 1) * Double(gross)
        let zaokrouhlene = (superhruba/100).rounded(.up) * 100
        let zalohaNaDan = Int(zaokrouhlene * 0.15)
        let zdravotniASocialni = Int(Double(gross) * (0.045 + 0.065))
        
        let slevaZaDeti = slevaNaDeti(pocetDeti)
        
        var zalohaPoSleve = zalohaNaDan - slevaZaDeti - slevaNaInvaliditu(stupne: invalidita)
        if student {
            zalohaPoSleve -= 335
        }
        if sleva {
            zalohaPoSleve -= slevaNaPoplatnika
        }
        if zalohaPoSleve < 0 {
//            if zalohaNaDan - slevaZaDeti > 0 {
//                zalohaPoSleve = 0
//            }
        }
        
        return gross - zdravotniASocialni - zalohaPoSleve
    }
    
    fileprivate func slevaNaInvaliditu(stupne invalidita: Invalidita) -> Int {
        switch invalidita {
        case .plná:
            return 420
        case .částečná:
            return 210
        default:
            return 0
        }
    }
}

