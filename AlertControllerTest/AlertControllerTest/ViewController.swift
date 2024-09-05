//
//  ViewController.swift
//  AlertControllerTest
//
//  Created by Lena on 9/5/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func infoAlert(_ sender: Any) {
        let alert = UIAlertController(title: "타이틀", message: "nil 넣으면 안나오는 message!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(action)
        
        present(alert, animated: true) {
            print("present 완료!")
        }
    }
    
    @IBAction func confirmAlert(_ sender: Any) {
        let alert = UIAlertController(title: "확인", message: "진짜 확인 하실건가요?", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(actionCancel)
        
        let actionOK = UIAlertAction(title: "진행시켜!", style: .default) { _ in
            print("완료되었습니다!")
        }
        alert.addAction(actionOK)
        
        present(alert, animated: true)
    }
    
    @IBAction func selectAlert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "~을 선택하세요", preferredStyle: .actionSheet)
        
        let actionOK = UIAlertAction(title: "확인", style: .default)
        alert.addAction(actionOK)
        
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(actionCancel)
        
        let actionDelete = UIAlertAction(title: "삭제", style: .destructive) { _ in
            print("삭제를 진행합니다")
        }
        alert.addAction(actionDelete)
        
        present(alert, animated: true)
    }
}
