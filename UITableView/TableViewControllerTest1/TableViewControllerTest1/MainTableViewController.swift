//
//  MainTableViewController.swift
//  TableViewControllerTest1
//
//  Created by Lena on 9/4/24.
//

import UIKit

class MainTableViewController: UITableViewController {

    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
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
        
        var cell: UITableViewCell
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "bts", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "bts1", for: indexPath)
        }
        let btsImageView = cell.viewWithTag(1) as? UIImageView
        btsImageView?.image = UIImage(named: btsImages[indexPath.row])
        
        let nameLabel = cell.viewWithTag(2) as? UILabel
        nameLabel?.text = bts[indexPath.row]
        
        let descLabel = cell.viewWithTag(3) as? UILabel
        descLabel?.text = "\(indexPath.row + 1)번째 멤버"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
