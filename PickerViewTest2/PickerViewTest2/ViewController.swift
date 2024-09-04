//
//  ViewController.swift
//  PickerViewTest2
//
//  Created by Lena on 9/2/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    // MARK: - DataSource 가 맡은 일들
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    // MARK: - Delegate
    // Delegate는 optional로 구성되어있으므로 에러가 나지 않음
    
    /*
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        // 첫번째 매개변수 : pickerView 넘겨줌
        // 두번째 매개변수 : 몇 번째 component인지 (구현하지 않으면 같은 크기로 설정됨)
        return CGFloat(5.0)
    }
     */
    
    // 각 row의 title 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "(\(component), \(row))"
    }
    
    /*
    // component의 width 설정
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 300
        } else {
            return 100
        }
    }
     */
    
    // component의 height 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 300
        } else {
            return 200
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // 이미지뷰를 뷰로 쓰려면 타입캐스팅을 해줘야 한다
        if let imageView = view as? UIImageView {
            // 타입캐스팅에 성공하면
            imageView.image = UIImage(systemName: "person.3")
            return imageView
        } else {
            // 실패하면 새로 만든다
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "person.3")
            return imageView
        }
    }
}

