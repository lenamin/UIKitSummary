//
//  ViewController.swift
//  PickerViewTest
//
//  Created by Lena on 8/30/24.
//

import UIKit

// Version 2.
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lblTitle: UILabel!
    let bts = ["진", "슈가", "제이홉", "RM", "지민", "뷔", "정국"]
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    // DataSource는 이 일만 한다
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return bts.count
        } else {
            return btsImages.count
        }
        // component == 0 ? 4 : 6
        // 삼항연산자 이용해서 같은 기능 한 줄로 표시할 수도 있음
    }
    
    /*
    // Delegate 가 하는 일들
    // 매개변수 이름으로 하는 역할을 알 수 있다
    // argument1 pickerView : UIPickerView 넘어오는 것
    // titleForRow : 각 row에 들어갈 제목
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 여기서 각 component에 해당하는 row 개수만큼 호출되면서 title을 뿌려줌
        if component == 0 {
            return bts[row]
        } else {
            return ""
        }
    }
    */
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let image = UIImage(named: btsImages[row])
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .center
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblTitle.text = bts[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200.0
    }
}
