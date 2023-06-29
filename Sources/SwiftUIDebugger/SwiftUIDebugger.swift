//
//  ConsolePrint.swift
//  
//
//  Created by Dmytro Chapovskyi on 29.06.2023.
//

import Foundation
import SwiftUI

public extension View {
	
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
	
	func printChanges() -> some View {
		let _ = Self._printChanges()
		return self
	}
}
