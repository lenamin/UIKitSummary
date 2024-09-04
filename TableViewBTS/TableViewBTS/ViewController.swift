//
//  ViewController.swift
//  TableViewBTS
//
//  Created by Lena on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = bts[indexPath.row]
        content.secondaryText = "\(indexPath.row + 1) 번째 멤버"
        content.image = UIImage(named: btsImages[indexPath.row])
        content.imageProperties.maximumSize.height = 100
        content.textProperties.color = .magenta
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        content.secondaryTextProperties.color = .brown
        cell.contentConfiguration = content
        return cell
    }
}

