//
//  ModuleBuilder.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation
import UIKit
import AVKit

protocol Builder {
	func createMain(router: RouterProtocol) -> UIViewController
	func createSelected(word: WordModel, router: RouterProtocol) -> UIViewController
}

class MainBuilder: Builder {
	func createMain(router: RouterProtocol) -> UIViewController {
		let vc = SearchWordViewController()
		let service = DataFetcherService()
		let synthesizer = AVSpeechSynthesizer()
		let presenter = WordPresenter(view: vc, dataFetcherService: service, synthesizer: synthesizer, router: router)
		vc.presenter = presenter
		return vc
	}
	
	func createSelected(word: WordModel, router: RouterProtocol) -> UIViewController {
		let vc = SelectedWordViewController()
		let synthesizer = AVSpeechSynthesizer()
		let presenter = SelectedWordPresenter(view: vc, word: word, synthesizer: synthesizer, router: router)
		vc.presenter = presenter
		return vc
	}
}
