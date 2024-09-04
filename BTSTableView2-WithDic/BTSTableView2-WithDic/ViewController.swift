//
//  ViewController.swift
//  BTSTableView2-WithDic
//
//  Created by Lena on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let bts: [[String:String]] = [["name":"RM", "image": "bts1", "desc": "1번째 멤버"],
                  ["name":"진", "image": "bts2", "desc": "2번째 멤버"],
                  ["name":"슈가", "image": "bts3", "desc": "3번째 멤버"],
                  ["name":"제이홉", "image": "bts4", "desc": "4번째 멤버"],
                  ["name":"지민", "image": "bts5", "desc": "5번째 멤버"],
                  ["name":"뷔", "image": "bts6", "desc": "6번째 멤버"],
                  ["name":"정국", "image": "bts7", "desc": "7번째 멤버"]]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableView야, 이름이 "paper"인 cell줘!
        let cell = tableView.dequeueReusableCell(withIdentifier: "paper", for: indexPath)
        var config = cell.defaultContentConfiguration()
        
        // 딕셔너리에서 멤버 뽑기
        let member: [String:String] = bts[indexPath.row]
        
        // Text
        config.text = member["name"] // String? 으로 타입이 같음
        config.textProperties.font = .systemFont(ofSize: 32, weight: .heavy)
        
        // Image
        if let imageName = member["image"] {
            config.image = UIImage(named: imageName)
            config.imageProperties.maximumSize.height = 80
        }
        
        // SecondaryText
        config.secondaryText = member["desc"]
        config.secondaryTextProperties.font = .systemFont(ofSize: 16, weight: .medium)
        config.secondaryTextProperties.color = .green
        
        cell.contentConfiguration = config
        return cell
    }
}

