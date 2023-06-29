//
//  Tools.swift
//  
//
//  Created by Dmytro Chapovskyi on 29.06.2023.
//

import SwiftUI

extension Color {
	static var random: Color {
		Color(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1)
		)
	}
}

extension Array {
	subscript(safe index: Int) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}
