//
//  ViewController.swift
//  BTSPickerView
//
//  Created by Lena on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let btsImages = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    let sfNames = ["1.circle", "2.circle", "3.circle", "4.circle", "5.circle", "6.circle", "7.circle", ]
    let btsNames = ["RM", "진", "슈가", "제이홉", "지민", "뷔", "정국"]
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var btsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    @IBAction func roll(_ sender: Any) {
        picker.selectRow(5, inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return sfNames.count
        } else {
            return btsNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        300.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 1 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: btsImages[row])
            imageView.contentMode = .scaleAspectFit
            return imageView
        } else {
            let sfImageView = UIImageView()
            sfImageView.image = UIImage(systemName: sfNames[row])
            sfImageView.contentMode = .scaleAspectFit
            sfImageView.tintColor = .darkGray
            return sfImageView
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {
            btsLabel.text = "안녕하세요! \(btsNames[row]) 입니다!"
        }
        picker.selectRow(5, inComponent: 0, animated: true)
    }
}
