//
//  ConsolePrint.swift
//  
//
//  Created by Dmytro Chapovskyi on 29.06.2023.
//

import Foundation
import SwiftUI

public extension View {
	
#if DEBUG || FORCE_SWIFTUI_DEBUGGER

	func printType() -> Self {
		let mirrorOneLine = "\(Mirror(reflecting: self).subjectType)"
		print(formatTypeString(mirrorOneLine))
		return self
	}
	
	func randomBackground() -> some View {
		background(Color.random)
	}
	
	func randomBorder() -> some View {
		border(Color.random)
	}

#else
	
//	@available(*, deprecated, message: "This function is deprecated.")
	func printType() -> Self { self }
	
	func randomBackground() -> some View { self }
	
	func randomBorder() -> some View { self }

#endif
}
