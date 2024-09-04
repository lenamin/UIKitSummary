//
//  ViewController.swift
//  TableViewTest-ReuseCell1
//
//  Created by Lena on 9/2/24.
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
        
        // 테이블뷰에게 요청한다.
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        print(cell)
        if cell == nil {
            // 새로운 것을 만든다
            // 재활용 할거니까, 어디에 들어갈건지 표시를 해야함!
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        // Optional Chaining : nil이면 아무것도 하지 않고, nil이 아니면 그 이후 동작 함
        // 하지만 알고 써야함. 계속 Nil이 나오는데 이유를 못찾을 수도 있다.
        var content = cell?.defaultContentConfiguration()
        content?.text = "\(indexPath.section)번째 section, \(indexPath.row)"
        cell?.contentConfiguration = content
        
        return cell!
    }

}

