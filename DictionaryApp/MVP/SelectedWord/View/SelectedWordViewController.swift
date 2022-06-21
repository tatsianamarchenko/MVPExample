//
//  SelectedWordViewController.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import UIKit

protocol SelectedWordViewProtocol: AnyObject {
	
}

class SelectedWordViewController: UIViewController, SelectedWordViewProtocol {
	
	var presenter: SelectedWordPresenterProtocol?
	
	private lazy var wordLable: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var transcriptionLable: UILabel = {
		var label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var meaningLable: UILabel = {
		var label = UILabel()
		label.lineBreakMode = .byCharWrapping
		label.numberOfLines = 0
		label.lineBreakStrategy = .pushOut
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var exampleLable: UILabel = {
		var label = UILabel()
		label.lineBreakMode = .byCharWrapping
		label.numberOfLines = 0
		label.lineBreakStrategy = .pushOut
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var soundButton: UIButton = {
		var button = UIButton()
		button.setImage(UIImage(systemName: "speaker.wave.3.fill"), for: .normal)
		button.addTarget(self, action: #selector(play), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(wordLable)
		view.addSubview(soundButton)
		view.addSubview(transcriptionLable)
		view.addSubview(meaningLable)
		view.addSubview(exampleLable)
		
		guard let presenter = presenter else {
			return
		}
		setInfo(word: presenter.word)
		
		NSLayoutConstraint.activate([
			soundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			soundButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			
			wordLable.leadingAnchor.constraint(equalTo: soundButton.trailingAnchor, constant: 10),
			wordLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			
			transcriptionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			transcriptionLable.topAnchor.constraint(equalTo: soundButton.bottomAnchor, constant: 10),
			
			meaningLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			meaningLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			meaningLable.topAnchor.constraint(equalTo: transcriptionLable.bottomAnchor, constant: 10),
			
			exampleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			exampleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			exampleLable.topAnchor.constraint(equalTo: meaningLable.bottomAnchor, constant: 10),
		])
	}
	
	@objc func play() {
		presenter?.speakerOn()
	}
	
	func setInfo(word: WordModel) {
		guard let partOfSpeech = word.meanings.first?.partOfSpeech else {
			return
		}
		wordLable.text = "\(word.word), \(partOfSpeech)"
		transcriptionLable.text = word.phonetic
		meaningLable.text = word.meanings.first?.definitions.first?.definition
		exampleLable.text = word.meanings.first?.definitions.first?.example
	}
	
}
