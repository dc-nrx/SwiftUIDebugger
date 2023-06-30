//
//  TypeFormatter.swift
//  
//
//  Created by Dmytro Chapovskyi on 29.06.2023.
//

import Foundation

enum Delimiter: Hashable {
	case open
	case comma
	case close
}

func formatTypeString(
	_ sStr: String,
	tab: String = "∣  ",
	openBracket: Character = "<",
	closeBracket: Character = ">",
	openParenthesis: Character = "(",
	closeParenthesis: Character = ")",
	comma: Character = ","
) -> String {
	var depth = 0
	let s = Array(sStr)
	var res = ""
	let delimiters = findDelimiters(s, openBracket, closeBracket, comma)
	var delimiterIdx = 0
	
	var i = 0
	while i < s.count {
		switch s[i] {
		case openBracket:
			res.append(openBracket)
			// Keep < and ( togather
			if s[safe: i + 1] == openParenthesis {
				i += 1
				res.append(openParenthesis)
			}
			// Avoid going to new line if there are no nested brackets
			if delimiters[safe: delimiterIdx + 1] != .close {
				depth += 1
				res.appendTab(depth, tab)
			}
			delimiterIdx += 1
		case closeParenthesis:
			if s[safe: i + 1] == closeBracket {
				i += 1
				fallthrough
			}
		case closeBracket:
			if delimiters[safe: delimiterIdx - 1] != .open {
				depth -= 1
				res.appendTab(depth, tab)
			}
			if s[safe: i - 1] == closeParenthesis {
				res.append(closeParenthesis)
			}
			res.append(closeBracket)
			delimiterIdx += 1
			if s[safe: i + 1] == "," {
				i += 1
				fallthrough
			}
		case comma:
			res.append(s[i])
			res.appendTab(depth, tab)
		case " ":
			// Drop whitespaces - there will be a newline anyway
			break
		default:
			res.append(s[i])
		}
		i += 1
	}
	return res
}

private extension String {

	mutating func appendTab(
		_ depth: Int,
		_ tab: String
	) {
		append("\n" + String(repeating: tab, count: depth))
	}
}

func findDelimiters(
	_ s: [Character],
	_ openBr: Character,
	_ closeBr: Character,
	_ comma: Character
) -> [Delimiter] {
	var result = [Delimiter]()
	for c in s {
		if c == openBr {
			result.append(.open)
		} else if c == closeBr {
			result.append(.close)
		}
//		else if c == "," {
//			result.append(.comma)
//		}
	}
	return result
}
