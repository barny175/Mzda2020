//
//  SalaryCalculatorTexts.swift
//  Mzda 2020Tests
//
//  Created by Martin Barnas on 07/08/2020.
//  Copyright © 2020 Martin Barnas. All rights reserved.
//

import XCTest
@testable import Mzda_2020

class SalaryCalculatorTests: XCTestCase {

    func testExample() throws {
        let calc = SalaryCalculator()
        let net = calc.netSalary(grossSalary: 15000, pocetDeti: 2, sleva: true, invalidita: .plná, student: true, ztp: true)
        XCTAssertEqual(16_234, net)
    }
    
    func testDetailSalary1() {
        let salary = DetailSalary(gross: 23000, sleva: true, deti: 2, invalidita: .částečná, ztp: true, student: true)
        XCTAssertEqual(5_704, salary.socialniZamestnavatel)
        XCTAssertEqual(2_070, salary.zdravotniZamestnavatel)
        XCTAssertEqual(30_774, salary.superHruba)
        XCTAssertEqual(2_884, salary.slevaNaDeti)
        XCTAssertEqual(2_070, salary.slevaNaPoplatnika)
        XCTAssertEqual(210, salary.slevaNaInvaliditu)
        XCTAssertEqual(1495, salary.socialniZamestnanec)
        XCTAssertEqual(1035, salary.zdravotniZamestnanec)
        XCTAssertEqual(1345, salary.slevaZtp)
        XCTAssertEqual(335, salary.slevaStudent)
        XCTAssertEqual(4620, salary.zalohaNaDanPredSlevou)
        XCTAssertEqual(660, salary.zalohaPoSleve)
        XCTAssertEqual(2_224, salary.danovyBonus)
        XCTAssertEqual(22_694, salary.cista)
    }
    
    func testDetailSalary2() {
        let salary = DetailSalary(gross: 15000, sleva: true, deti: 2, invalidita: .plná, ztp: true, student: true)
        XCTAssertEqual(3_720, salary.socialniZamestnavatel)
        XCTAssertEqual(1_350, salary.zdravotniZamestnavatel)
        XCTAssertEqual(20_070, salary.superHruba)
        XCTAssertEqual(2_884, salary.slevaNaDeti)
        XCTAssertEqual(2_070, salary.slevaNaPoplatnika)
        XCTAssertEqual(420, salary.slevaNaInvaliditu)
        XCTAssertEqual(975, salary.socialniZamestnanec)
        XCTAssertEqual(675, salary.zdravotniZamestnanec)
        XCTAssertEqual(3_015, salary.zalohaNaDanPredSlevou)
        XCTAssertEqual(1_345, salary.slevaZtp)
        XCTAssertEqual(335, salary.slevaStudent)
        XCTAssertEqual(0, salary.zalohaPoSleve)
        XCTAssertEqual(2_884, salary.danovyBonus)
        XCTAssertEqual(16_234, salary.cista)
    }
    
    func example2() {
        let calc = SalaryCalculator()
        let net = calc.netSalary(grossSalary: 32_000, pocetDeti: 3, sleva: true, invalidita: .částečná, student: false, ztp: true)
        XCTAssertEqual(30_571, net)
    }

    
    func example3() {
        let calc = SalaryCalculator()
        let net = calc.netSalary(grossSalary: 15_000, pocetDeti: 2, sleva: true, invalidita: .plná, student: false, ztp: false)
        assert(net == 15_289)
    }

}
