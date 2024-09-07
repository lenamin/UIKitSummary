//
//  ViewController.swift
//  BTSTableView-WithTeacher
//
//  Created by Lena on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblMember: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bts.count
    }
    
    /*
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = bts[indexPath.row]
        content.secondaryText = "\(indexPath.row + 1) 번째 멤버입니다!"
        content.secondaryTextProperties.color = .systemIndigo
        content.secondaryTextProperties.font = .systemFont(ofSize: 12, weight: .light)
        content.textProperties.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        content.textProperties.color = .darkGray
        
        content.image = UIImage(named: btsImages[indexPath.row])
        content.imageProperties.maximumSize.height = 80.0
        
        cell.contentConfiguration = content
        
        return cell
    }
    */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "bts")
        
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "bts")
        }
        // 이 style이 먹으려면 prototype cells 수가 기존에 있다면 0이어야 함
        
        var config = cell!.defaultContentConfiguration()
        config.image = UIImage(named: btsImages[indexPath.row])
        config.imageProperties.maximumSize.height = 80.0
        
        config.text = bts[indexPath.row]
        config.textProperties.font = .systemFont(ofSize: 24, weight: .heavy)
        config.textProperties.color = .cyan
        
        config.secondaryText = "\(indexPath.row + 1)번째 멤버입니다."
        config.secondaryTextProperties.color = .darkGray
        cell?.contentConfiguration = config
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 사용할 수 있는 정보는 tableView와 didSelectRowAt 두개!
        lblMember.text = bts[indexPath.row]
    }
}

