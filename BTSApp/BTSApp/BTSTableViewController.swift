//
//  BTSTableViewController.swift
//  BTSApp
//
//  Created by Lena on 9/4/24.
//

import UIKit

class BTSTableViewController: UITableViewController {

    let bts = ["Loopy", "Luna", "Looppie", "Moomin", "Piglet", "Pooh", "Pororo"]
    let btsImages: [String] = ["loopy", "luna", "loopygirl", "moomin", "piglet", "pooh", "pororo"]
    let btsDic: [[String:String]] = [["name":"Loopy", "image": "loopy", "desc": "1번째 멤버"],
                  ["name":"Luna", "image": "luna", "desc": "2번째 멤버"],
                  ["name":"Looppie", "image": "loopygirl", "desc": "3번째 멤버"],
                  ["name":"Moomin", "image": "moomin", "desc": "4번째 멤버"],
                  ["name":"Piglet", "image": "piglet", "desc": "5번째 멤버"],
                  ["name":"Pooh", "image": "pooh", "desc": "6번째 멤버"],
                  ["name":"Pororo", "image": "pororo", "desc": "7번째 멤버"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "Cutties"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        
        /*
        let imageView = cell.viewWithTag(1) as? UIImageView
        imageView?.contentMode = .scaleAspectFill
        imageView?.image = UIImage(named: btsImages[indexPath.row])
        
        let lblNick = cell.viewWithTag(2) as? UILabel
        lblNick?.text = bts[indexPath.row]

        let lblDesc = cell.viewWithTag(3) as? UILabel
        lblDesc?.text = "\(indexPath.row + 1)번째 멤버!"
        */
        
        let member = btsDic[indexPath.row]
        let imageView = cell.viewWithTag(1) as? UIImageView
        
        if let imageName = member["image"] {
            imageView?.image = UIImage(named: imageName)
        }
        
        let lblNick = cell.viewWithTag(2) as? UILabel
        lblNick?.text = member["name"]
        
        let lblDesc = cell.viewWithTag(3) as? UILabel
        lblDesc?.text = member["desc"]
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 얘네들은 항상 super class를 넘겨준다. 우리가 원하는건 DetailViewController인데,
        // destination이 주는건 UIViewController! 그래서 타입캐스팅 하는 것
        let newVC = segue.destination as? DetailViewController
        
        /*
        guard let newVC else {
            return
        }
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        */
        guard let newVC = newVC,// 3 > 5 였을 때 false면 바로 else 로 탈출! 하는방식으로 쓸 수도 있음
              let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        /*
        newVC.imageName = btsImages[indexPath.row]
        newVC.memberName = bts[indexPath.row]
        */
        newVC.member = btsDic[indexPath.row]
        
        // 넘겨줄 때는 한 덩어리로 넘겨주는게 좋겠지
    }
}
