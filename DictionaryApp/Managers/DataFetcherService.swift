//
//  DataFetcherService.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    
	init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
		self.networkDataFetcher = networkDataFetcher
    }
    
	func fetchNewWord(word: String, completion: @escaping ([WordModel]?) -> Void) {
        let urlNewWord = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewWord, response: completion)
    }

	func fetchErrorMessage(completion: @escaping (ErrorModel?) -> Void) {
		let urlNewWord = "https://api.dictionaryapi.dev/api/v2/entries/en/hjkllbjhkbj"
		networkDataFetcher.fetchGenericJSONData(urlString: urlNewWord, response: completion)
	}
}
