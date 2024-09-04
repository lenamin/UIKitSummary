//
//  ViewController.swift
//  TableViewTest-ReuseCell2
//
//  Created by Lena on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print(cell)
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.section) 섹션, \(indexPath.row) row"
        cell.contentConfiguration = content
        cell.contentConfiguration = content
        return cell
    }
}

