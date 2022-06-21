//
//  WordModel.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation

struct WordModel: Codable {
	let word: String
	let phonetic: String
	let meanings: [Meaning]
}

struct Meaning: Codable {
	let partOfSpeech: String
	let definitions: [Definition]
	let synonyms, antonyms: [String]
}

struct Definition: Codable {
	let definition: String
	let synonyms, antonyms: [String?]
	let example: String?
}
