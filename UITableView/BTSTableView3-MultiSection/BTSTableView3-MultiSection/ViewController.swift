//
//  ViewController.swift
//  BTSTableView3-MultiSection
//
//  Created by Lena on 9/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let exo = ["시우민", "디오", "첸", "백현", "세훈", "루한", "레이", "찬열", "수호", "크리스", "타오"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - DataSource Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    // ???: - 잘 모르겠어!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        if section == 0 {
            return bts.count
        } else {
            return exo.count
        }
         */
        section == 0 ? bts.count : exo.count
    }
    
    // TODO: - 해야할 일
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idol", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        if indexPath.section == 0 {
            config.text = bts[indexPath.row]
        } else {
            config.text = exo[indexPath.row]
        }
        
        cell.contentConfiguration = config
        
        // 다섯가지 타입이 있음
        switch indexPath.row % 5 {
        case 0: cell.accessoryType = .checkmark
        case 1: cell.accessoryType = .detailButton
        case 2: cell.accessoryType = .detailDisclosureButton
        case 3: cell.accessoryType = .disclosureIndicator
        case 4: cell.accessoryType = .none
        default: cell.accessoryType = .none
        }
        
        return cell
    }
    
    // FIXME: - 수정해야 할 것들
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "BTS"
        } else {
            return "EXO"
        }
    }
    
    /*
    // !!!: - 경고: 전달되는 값이 nil이 아니어야 함
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        section == 0 ? "BTS 멤버 총 수는 \(bts.count)" : "EXO 멤버 총 수는 \(exo.count)"
    }
     */
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if section == 0 {
            imageView.image = UIImage(systemName: "person.3.fill")
        } else {
            imageView.image = UIImage(systemName: "person.3")
        }
        return imageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50.0
    }
}
