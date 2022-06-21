//
//  Router.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import Foundation
import UIKit

protocol RouterMain {
	var navigationController: UINavigationController? {get set}
	var builder: Builder? { get set }
}

protocol RouterProtocol: RouterMain {
	func initialViewController()
	func showInfo(word: WordModel)
}

class Router: RouterProtocol {
	var navigationController: UINavigationController?
	var builder: Builder?
	
	init(navigationController: UINavigationController, builder: Builder) {
		self.navigationController = navigationController
		self.builder = builder
	}
	
	func initialViewController() {
		if let navigationController = navigationController  {
			guard let mainVC = builder?.createMain(router: self) else {
				return
			}
			navigationController.viewControllers = [mainVC]
		}
	}
	
	func showInfo(word: WordModel) {
		if let navigationController = navigationController  {
			guard let mainVC = builder?.createSelected(word: word, router: self) else {
				return
			}
			navigationController.pushViewController(mainVC, animated: true)
		}
	}
}
