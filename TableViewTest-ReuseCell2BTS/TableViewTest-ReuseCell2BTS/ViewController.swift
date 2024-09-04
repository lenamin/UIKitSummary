//
//  ViewController.swift
//  TableViewTest-ReuseCell2BTS
//
//  Created by Lena on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = bts[indexPath.row]
        content.image = UIImage(named: btsImages[indexPath.row])
        content.imageProperties.maximumSize.height = 100.0
        cell.contentConfiguration = content
        return cell
        
    }

}

