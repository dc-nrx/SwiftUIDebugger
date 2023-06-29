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
	openBr: Character = "<",
	closeBr: Character = ">",
	openPar: Character = "(",
	closePar: Character = ")",
	comma: Character = ","
) -> String {
	var depth = 0
	let s = Array(sStr)
	var res = ""
	let br = findDelimiters(s, openBr, closeBr, comma)
	var brIdx = 0
	var i = 0
	while i < s.count {
		switch s[i] {
		case openBr:
			depth += 1
			res.append("<")
			if s[safe: i + 1] == openPar {
				i += 1
				res.append("(")
			}
			if br[safe: brIdx + 1] != .close {
				res.append("\n" + String(repeating: tab, count: depth))
			}
			brIdx += 1
		case closePar:
			if s[safe: i + 1] == closeBr {
				i += 1
				fallthrough
			}
		case closeBr:
			depth -= 1
			if br[safe: brIdx - 1] != .open {
				res.append("\n" + String(repeating: tab, count: depth))
			}
			if s[safe: i - 1] == closePar {
				res.append(")")
			}
			res.append(">")
			brIdx += 1
			if s[safe: i + 1] == "," {
				i += 1
				fallthrough
			}
		case comma:
			res.append(String(s[i]) + "\n" + String(repeating: tab, count: depth))
		case " ":
			break
		default:
			res.append(s[i])
		}
		i += 1
	}
	return res
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
