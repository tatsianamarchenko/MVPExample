//
//  WordPresenter.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation

protocol WordPresenterProtocol: AnyObject {
	init(view: SearchWordProtocol, dataFetcherService: DataFetcherService)
	func findWord(word: String)
}


class WordPresenter: WordPresenterProtocol {
	var view: SearchWordProtocol
	var dataFetcherService: DataFetcherService
	required init(view: SearchWordProtocol, dataFetcherService: DataFetcherService) {
		self.view = view
		self.dataFetcherService = dataFetcherService
	}

	func findWord(word: String) {
		dataFetcherService.fetchNewWord(word: "hello") { word in
			print(word)
		}
	}
}
