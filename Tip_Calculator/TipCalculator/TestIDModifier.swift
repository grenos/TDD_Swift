//
//  TestIDModifier.swift
//  TipCalculator
//
//  Created by Vasileios  Gkreen on 17/11/21.
//

import SwiftUI

struct TestIdModifier: ViewModifier {
	let id: String?
	
	func body(content: Content) -> some View {
		content
			.accessibility(identifier: id ?? "")
	}
}

extension View {
	///This wrapper simplifies the call so we don't have to use the .modifier(A11yModifier()) syntax
	func testid(_ id: String = "") -> some View {
		self.modifier(TestIdModifier(id: id))
	}
}
