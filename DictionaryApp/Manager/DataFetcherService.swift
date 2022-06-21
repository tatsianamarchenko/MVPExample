//
//  DataFetcherService.swift

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    
	init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
		self.networkDataFetcher = networkDataFetcher
    }
    
	func fetchNewWord(word: String, completion: @escaping (WordModel?) -> Void) {
        let urlNewGames = "https://api.dictionaryapi.dev/api/v2/entries/en/\(word)"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
}
