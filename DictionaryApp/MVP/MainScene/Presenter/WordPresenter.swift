//
//  WordPresenter.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation
import AVKit

protocol WordPresenterProtocol: AnyObject {
	init(view: SearchWordViewProtocol, dataFetcherService: DataFetcherService, synthesizer: AVSpeechSynthesizer, router: RouterProtocol)
	func findWord(word: String)
	func selectWord(word: WordModel)
}

class WordPresenter: WordPresenterProtocol {
	weak var view: (SearchWordViewProtocol)?
	var dataFetcherService: DataFetcherService
	var synthesizer: AVSpeechSynthesizer
	var router: RouterProtocol?
	
	required init(view: SearchWordViewProtocol, dataFetcherService: DataFetcherService, synthesizer: AVSpeechSynthesizer, router: RouterProtocol) {
		self.view = view
		self.dataFetcherService = dataFetcherService
		self.synthesizer = synthesizer
		self.router = router
	}
	
	func findWord(word: String) {
		dataFetcherService.fetchNewWord(word: word) { [weak self] word in
			guard let word = word else {
				self?.dataFetcherService.fetchErrorMessage() { [weak self] errorMessage in
					guard let errorMessage = errorMessage else {
						return
					}
					self?.view?.showError(searchResult: errorMessage)
				}
				return
			}
			let utterance = AVSpeechUtterance(string: word.first?.word ?? "no word")
			utterance.voice = AVSpeechSynthesisVoice(language: "eng-ENG")
			self?.synthesizer.speak(utterance)
			self?.view?.showWord(searchResult: word)
		}
	}

	func selectWord(word: WordModel) {
		router?.showInfo(word: word)
	}
	
}
