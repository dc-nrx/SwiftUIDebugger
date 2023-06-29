import XCTest
@testable import SwiftUIDebugger

final class SwiftUIDebuggerTests: XCTestCase {

	let sample1 = "ModifiedContent<VStack<TupleView<(Button<Text>,CounterView)>,ExtraView>>"
	let sample1_formatted = ""
	
	let sample2 = "ModifiedContent<VStack<TupleView<(Button<Text>, Optional<ModifiedContent<Text, _BackgroundStyleModifier<Color>>>, ModifiedContent<Text, _BackgroundStyleModifier<Color>>, ExtraView, CounterView)>>, _OverlayModifier<_ShapeView<_StrokedShape<_Inset>, Color>>>"

	let sample3 = "ForEach<ClosedRange<Int>, Int, TupleView<(Text, Spacer)>>"
	let sample3_formatted = """
ForEach<
∣  ClosedRange<Int>,
∣  Int,
∣  TupleView<(
∣  ∣  Text,
∣  ∣  Spacer
∣  )>
>
"""

	
	
	func testFormatSample3_withDefaultParameters() throws {
		print(formatTypeString(sample1))
		print(formatTypeString(sample2))
		print(formatTypeString(sample3))
//		XCTAssertEqual(formatTypeString(sample3), sample3_formatted)
	}
	
}
