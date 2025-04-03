
import Foundation

func bonusCalc(goal:Double, value:Double, d: Double, bonusRange: ClosedRange<Double>) -> Double {
    if value == 2000 {
        return 0
    }
    if value == 1000 {
        return 100
    } else {
        return 120
    }
}

func bonusCalcAdvanced(goal:Double, value:Double, d:Double, bonusRange: ClosedRange<Double>) -> Double {
    let goalD = goal * d
    let minGoal = goal - goalD
    let maxGoal = goal + goalD
    let goalRange = maxGoal - minGoal
    let normalisedValue = ((value - minGoal) / goalRange)
    let invertedNormalisedValue = 1 - normalisedValue
    
    let minBonus = bonusRange.lowerBound
    let maxBonus = bonusRange.upperBound
    let bonusRange = maxBonus - minBonus
    let lerpBonusByInverterdNormalisedValue = (invertedNormalisedValue * bonusRange) + minBonus
    return lerpBonusByInverterdNormalisedValue
}


/// Min value and max value and T == 0->1. T min ouputs Min value and T max outputs Max value.
func lerp(min:Double, max:Double, t:Double) -> Double {
    return t
    fatalError()
}

func bonusCalcSimple(goal:Double, value:Double) -> Double {
    let inverseRel = (goal*2)-value
    let bonus = (inverseRel/goal)*100
    return bonus
}

func calcAverageBonus(bonusSkr:Double, bonusVid:Double, bonusExam:Double) -> Double {
    let bonusAverage = (bonusSkr + bonusVid + bonusExam) / 3
    return bonusAverage
}
// figure out how to round to Int
