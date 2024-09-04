//
//  ViewController.swift
//  Image
//
//  Created by Lena on 8/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnTouched(_ sender: Any) {
        imageView.image = .bts1
    }
}
