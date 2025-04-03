//
//  calctestTests.swift
//  calctestTests
//
//  Created by Wilde, Lillian, Dr. on 22.03.25.
//

import Testing
import Foundation
@testable import calctest

struct testOne {
    
    @Test(arguments: [
        (6000.0, 6000.0, 100),
        (3000.0, 1500.0, 150),
        (6000.0, 9000.0, 50)
    ])
    
    func testBonusCalcSimple(goal:Double, value:Double, bonus:Double) throws {
        #expect(bonusCalcSimple(goal:goal, value:value) == bonus)
    }
}

struct testTwo {
    
    @Test(arguments: [
        (1, 1, 1, 1),
        (2, 2, 2, 2),
        (100, 150, 50, 100),
        (128, 112, 88, 109.3333333333333333)
    ])
    
    func testCalcAverageBonus(bonusSkr:Double, bonusVid:Double, bonusExam:Double, bonusAverage:Double) throws {
        #expect(calcAverageBonus(bonusSkr:bonusSkr, bonusVid:bonusVid, bonusExam:bonusExam) == bonusAverage)
    }
}
