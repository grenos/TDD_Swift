//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Vasileios  Gkreen on 17/11/21.
//

import XCTest

class when_contentView_is_shown: XCTestCase {
	
	private var app: XCUIApplication!
	private var contentViewPage: ContentViewPage!
	
	override func setUp() {
		app = XCUIApplication()
		contentViewPage = ContentViewPage(app: app)
		continueAfterFailure = false
		app.launch()
	}
	
	func test_textfield_contains_default_value() {
		XCTAssertEqual(contentViewPage.totalTextFiled.value as! String, "Enter total")
	}
	
	func test_segmentedPicker_default_is_correct() {
		let segmentedButton = contentViewPage.segmentedControl.buttons.element(boundBy: 1) // index 1 (second button)
		XCTAssertTrue(segmentedButton.isSelected)
		XCTAssertEqual(segmentedButton.label, "20%")
	}
	
//	override func tearDown() {}
}


class when_calculate_tip_is_pressed_with_valid_data: XCTestCase {
	private var app: XCUIApplication!
	private var contentViewPage: ContentViewPage!
	
	override func setUp() {
		app = XCUIApplication()
		contentViewPage = ContentViewPage(app: app)
		continueAfterFailure = false
		app.launch()
		
		let tip = contentViewPage.totalTextFiled
		tip.tap()
		tip.typeText("100")
		
		let button = contentViewPage.calculateTipButton
		button.tap()
		
	}
	
	
	func test_correct_tip_is_displayed() {
		let tipText = contentViewPage.tipText
		let _ = tipText.waitForExistence(timeout: 0.5)
		XCTAssertEqual(tipText.label, "$20.00")
	}
}


class when_calculate_tip_is_pressed_with_invalid_data: XCTestCase {
	private var app: XCUIApplication!
	private var contentViewPage: ContentViewPage!
	
	override func setUp() {
		app = XCUIApplication()
		contentViewPage = ContentViewPage(app: app)
		continueAfterFailure = false
		app.launch()
		
		let tip = contentViewPage.totalTextFiled
		tip.tap()
		tip.typeText("-100")
		
		contentViewPage.calculateTipButton.tap()
	}
	
	func test_display_error_for_invalid_input() {
		let messageText = contentViewPage.messageText
		XCTAssertEqual(messageText.label, "Invalid Input")
	}
}
