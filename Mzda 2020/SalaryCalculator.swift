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
let SLEVA_NA_POPLATNIKA = 2070
let SLEVA_STUDENT = 335
let SLEVA_ZTP = 1345

let slevyNaDeti = [1267, 1617, 2017]

class DetailSalary {
    var hruba: Int = 0
    var sleva: Bool
    var deti: Int = 0
    var invalidita: Invalidita = .žádná
    var ztp: Bool = false
    var student: Bool = false
    
    var superHruba: Int {
        get {
            return zdravotniZamestnavatel + socialniZamestnavatel + hruba
        }
    }
    var superHrubaPoZaokrouhleni: Int {
        get {
            return Int((Double(superHruba)/100).rounded(.up) * 100)
        }
    }
    var slevaNaPoplatnika: Int {
        get {
            return sleva ? SLEVA_NA_POPLATNIKA : 0
        }
    }
    var socialniZamestnavatel: Int {
        get {
            return Int(socialni * Double(hruba))
        }
    }
    var zdravotniZamestnavatel: Int {
        get {
            return Int(zdravotni * Double(hruba))
        }
    }
    var socialniZamestnanec: Int {
        get {
            return Int(Double(hruba) * 0.065)
        }
    }
    var zdravotniZamestnanec: Int {
        get {
            return Int(Double(hruba) * 0.045)
            }
    }
    var zalohaNaDanPredSlevou: Int {
        get {
            return Int(Double(superHrubaPoZaokrouhleni) * 0.15)
        }
    }
    var slevaZtp: Int {
        get {
            return ztp ? SLEVA_ZTP : 0
        }
    }
    var slevaNaInvaliditu: Int {
        get {
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
    var zalohaPoSleve: Int {
        get {
            let zal = zaloha()
            return zal < 0 ? 0 : zal
        }
    }
    fileprivate func zaloha() -> Int {
        return zalohaNaDanPredSlevou - slevaNaInvaliditu - slevaStudent - slevaNaPoplatnika - slevaZtp
    }
    var danovyBonus: Int {
        get {
            let zal = zalohaPoSleve - slevaNaDeti
            return zal < 0 ? -zal : 0
        }
    }
    var slevaStudent: Int {
        get {
            return student ? SLEVA_STUDENT : 0
        }
    }
    var cista: Int {
        get {
            return hruba - zdravotniZamestnanec - socialniZamestnanec + danovyBonus
        }
    }
    init(gross: Int, sleva: Bool, deti: Int, invalidita: Invalidita, ztp: Bool, student: Bool) {
        self.hruba = gross
        self.sleva = sleva
        self.deti = deti
        self.invalidita = invalidita
        self.ztp = ztp
        self.student = student
    }

    var slevaNaDeti: Int {
        get {
            var sleva = 0
            for k in 0..<deti {
                sleva += slevyNaDeti[k < slevyNaDeti.count ? k : slevyNaDeti.count - 1]
            }
            return sleva
        }
    }
}

class SalaryCalculator {
    
    func netSalary(grossSalary: Int, pocetDeti: Int, sleva: Bool, invalidita: Invalidita, student: Bool, ztp: Bool) -> Int {
        let salary = DetailSalary(gross: grossSalary, sleva: sleva, deti: pocetDeti, invalidita: invalidita, ztp: ztp, student: student)
        
        let zalohaPoSleve = salary.zalohaPoSleve
        if zalohaPoSleve < 0 {
//            if zalohaNaDan - slevaZaDeti > 0 {
//                zalohaPoSleve = 0
//            }
        }
        
        return salary.cista
    }
}

