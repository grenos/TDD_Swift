//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Vasileios  Gkreen on 17/11/21.
//

import Foundation


enum TipCalculatorError: Error {
	case invalidInput
}


class TipCalculator {
	
	func calculate(total: Double, tipPercentage: Double) throws -> Double {
		if total < 0 { throw TipCalculatorError.invalidInput }
	
		let tip = total * tipPercentage
		return tip
	}
	
}
 
