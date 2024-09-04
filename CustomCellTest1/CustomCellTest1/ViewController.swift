//
//  ViewController.swift
//  CustomCellTest1
//
//  Created by Lena on 9/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        imageView?.image = UIImage(named: btsImages[indexPath.row])
        
        let lblNick = cell.viewWithTag(2) as? UILabel
        lblNick?.text = bts[indexPath.row]
        
        let lblDesc = cell.viewWithTag(3) as? UILabel
        lblDesc?.text = "\(indexPath.row + 1)번째 멤버"
        
        return cell
    }
}
