//
//  DetailViewController.swift
//  BTSApp
//
//  Created by Lena on 9/4/24.
//

import UIKit

class DetailViewController: UIViewController {

    // 받는 쪽 할일들
    
    /*
    var imageName: String? // Instancing할 때 (생성될 때, 넘겨받기전에는) 이 값이 없으니까 optional로 받아야 함
    var memberName: String?
    */
    
    var member: [String:String]?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblNick: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNick.text = member?["name"]
        
        /*
        if let imageName {
            imageView.image = UIImage(named: imageName)
        }
         */
        
        if let imageName = member?["image"] {
            imageView.image = UIImage(named: imageName)
        }
        
        // 받아야 할 데이터 bts, btsImages 의 각 String 넘겨받아야 함
    }
}
