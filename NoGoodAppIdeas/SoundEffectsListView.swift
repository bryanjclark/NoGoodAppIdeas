//
//  SoundEffectsListView.swift
//  NoGoodAppIdeas
//
//  Created by Bryan Clark on 6/14/19.
//  Copyright © 2019 Bryan Clark. All rights reserved.
//

import UIKit

fileprivate let soundCellIdentifier = "soundCellIdentifier"

public class SoundEffectsListView: UITableViewController {
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: soundCellIdentifier)
		self.navigationItem.title = "No Good App Ideas"
	}

	public override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return SoundEffects.validFiles.count
	}

	public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: soundCellIdentifier, for: indexPath)
		let effect = SoundEffects.validFiles[indexPath.row]
		cell.textLabel?.text = effect.rawValue
		return cell
	}

	public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let effect = SoundEffects.validFiles[indexPath.row]
		SoundEffectsManager.shared.play(soundEffect: effect)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
