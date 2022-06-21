//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Tatsiana Marchanka on 21.06.22.
//

import UIKit

protocol SearchWordViewProtocol: AnyObject {
	func showWord(searchResult: [WordModel])
	func showError(searchResult: ErrorModel)
}

class SearchWordViewController: UIViewController, SearchWordViewProtocol {
	var presenter: WordPresenterProtocol?
	private var timer: Timer?
	let searchController = UISearchController(searchResultsController: nil)
	var words = [WordModel]()
	
	private lazy var table : UITableView = {
		let table = UITableView()
		table.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.cellIdentifier)
		table.translatesAutoresizingMaskIntoConstraints = false
		return table
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupSearchBar()
		view.backgroundColor = .systemBackground
		view.addSubview(table)
		
		table.dataSource = self
		table.delegate = self
		
		NSLayoutConstraint.activate([
			table.widthAnchor.constraint(equalTo: view.widthAnchor),
			table.heightAnchor.constraint(equalTo: view.heightAnchor),
		])
	}
	
	func showWord(searchResult: [WordModel]) {
		self.words = searchResult
		self.table.reloadData()
	}

	func showError(searchResult: ErrorModel) {
		let alert = UIAlertController(title: searchResult.title, message: searchResult.message, preferredStyle: .actionSheet)
		let cancel = UIAlertAction(title: "Cancel", style: .cancel)
		alert.addAction(cancel)
		present(alert, animated: true)
	}
	
	private func setupSearchBar() {
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
		searchController.searchBar.delegate = self
	}
}

extension SearchWordViewController: UISearchBarDelegate {
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		timer?.invalidate()
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
			self?.presenter?.findWord(word: searchText)
		})
	}
}

extension  SearchWordViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return words.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = table.dequeueReusableCell(withIdentifier: MainViewCell.cellIdentifier, for: indexPath) as? MainViewCell else {
			return UITableViewCell()
		}
		cell.config(model: words[indexPath.row])
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.selectWord(word: words[indexPath.row])
	}
	
}


