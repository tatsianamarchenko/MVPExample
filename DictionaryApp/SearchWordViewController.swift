//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import UIKit

protocol SearchWordProtocol: AnyObject {
	func showWord(word: WordModel)
}

class SearchWordViewController: UIViewController, SearchWordProtocol {
	var presenter: WordPresenterProtocol?
	private var timer: Timer?

	let searchController = UISearchController(searchResultsController: nil)

//	var tracks = [Track]()

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .white

		setupSearchBar()

	//	tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
	}

	func showWord(word: WordModel) {
		presenter?.findWord(word: "hello")
	}

	private func setupSearchBar() {
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		searchController.searchBar.delegate = self
	}
//
//	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//	//	return tracks.count
//	}
//
//	 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
//		let track = tracks[indexPath.row]
//		cell.textLabel?.text = "\(track.trackName)\n\(track.artistName)"
//		cell.textLabel?.numberOfLines = 2
//		cell.imageView?.image = #imageLiteral(resourceName: "30x30bb")
//		return cell
//	}

}

extension SearchWordViewController: UISearchBarDelegate {

//	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//		timer?.invalidate()
//		timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
//			self.networkService.fetchTracks(searchText: searchText) { [weak self] searchResults in
//				self?.tracks = searchResults?.results ?? []
//				self?.tableView.reloadData()
//			}
//		})
//	}
}
