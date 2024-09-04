//
//  ViewController.swift
//  TableViewTest1
//
//  Created by Lena on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let btsNames = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    // MARK: - Required Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 원하는 내용이 나오게 만들어줘야 함
        let cell = UITableViewCell()
        
        // cell.textLabel에 접근할 수 있었지만 이건 deprecated 됨
        // content configuration을 가져와야 한다
        var content = cell.defaultContentConfiguration()
        // structure이기 때문에 값을 바꾸려면 var로 선언해야 함
        // 이건 빈 contentConfiguration임
        
        content.text = btsNames[indexPath.row]
        content.image = UIImage(named: btsImages[indexPath.row])
        
        // 만든 contentContriguration을 cell에 담아줌
        cell.contentConfiguration = content
        
        return cell
    }
}

