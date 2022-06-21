//
//  SceneDelegate.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let navViewController = UINavigationController()
		let builder = MainBuilder()
		let router = Router(navigationController: navViewController, builder: builder)
		router.initialViewController()
		window?.rootViewController = navViewController
		window?.makeKeyAndVisible()
	}

}

