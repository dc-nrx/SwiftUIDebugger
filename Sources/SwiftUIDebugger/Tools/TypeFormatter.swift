//
//  TypeFormatter.swift
//  
//
//  Created by Dmytro Chapovskyi on 29.06.2023.
//

import Foundation

enum Bracket: Hashable {
	case open
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
	let br = bracks(s, openBr, closeBr)
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

func bracks(
	_ s: [Character],
	_ openBr: Character,
	_ closeBr: Character
) -> [Bracket] {
	var result = [Bracket]()
	for c in s {
		if c == "<" {
			result.append(.open)
		} else if c == ">" {
			result.append(.close)
		}
	}
	return result
}
