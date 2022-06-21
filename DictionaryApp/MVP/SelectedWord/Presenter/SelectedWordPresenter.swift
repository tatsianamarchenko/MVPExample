//
//  SelectedWordPresenter.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation
import AVKit

protocol SelectedWordPresenterProtocol: AnyObject {
	init(view: SelectedWordViewProtocol, word: WordModel, synthesizer: AVSpeechSynthesizer, router: RouterProtocol)
	var word: WordModel { get set }
	func speakerOn()
}

class SelectedWordPresenter: SelectedWordPresenterProtocol {
	weak var view: (SelectedWordViewProtocol)?
	var word: WordModel
	var synthesizer: AVSpeechSynthesizer
	var router: RouterProtocol?
	
	required init(view: SelectedWordViewProtocol, word: WordModel, synthesizer: AVSpeechSynthesizer, router: RouterProtocol) {
		self.view = view
		self.word = word
		self.synthesizer = synthesizer
		self.router = router
	}
	
	func speakerOn() {
		let utterance = AVSpeechUtterance(string: word.word)
		utterance.voice = AVSpeechSynthesisVoice(language: "eng-ENG")
		self.synthesizer.speak(utterance)
	}
}
