//
//  Cell.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class MainViewCell: UITableViewCell {
	
	private lazy var title : UILabel = {
		var title = UILabel()
		title.translatesAutoresizingMaskIntoConstraints = false
		title.font = UIFont.systemFont(ofSize: 20)
		title.textColor = .label
		return title
	}()
	
	private lazy var descrip : UILabel = {
		var descrip = UILabel()
		descrip.translatesAutoresizingMaskIntoConstraints = false
		descrip.font = UIFont.systemFont(ofSize: 16)
		descrip.textColor = .secondaryLabel
		return descrip
	}()
	
	static var cellIdentifier = "MainViewCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.addSubview(descrip)
		contentView.addSubview(title)
		
		NSLayoutConstraint.activate([
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
			
			descrip.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			descrip.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
		])
	}
	
	func config(model : WordModel) {
		descrip.text = model.meanings.first?.definitions.first?.definition
		title.text = model.word
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
