//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Vasileios  Gkreen on 17/11/21.
//

import Foundation
import XCTest

class ContentViewPage {
	var app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	var totalTextFiled: XCUIElement {
		app.textFields["totalTextfield"]
	}
	
	var segmentedControl: XCUIElement {
		app.segmentedControls["tipPercentageSegmented"]
	}
	
	var calculateTipButton: XCUIElement {
		app.buttons["calculateTipButton"]
	}
	
	var tipText: XCUIElement {
		app.staticTexts["tipText"]
	}
	
	var messageText: XCUIElement {
		app.staticTexts["messageText"]
	}
}
