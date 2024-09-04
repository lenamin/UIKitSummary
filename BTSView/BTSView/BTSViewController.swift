//
//  BTSViewController.swift
//  BTSView
//
//  Created by Lena on 8/30/24.
//

import UIKit

class BTSViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let btsImages: [String] = ["bts1", "bts2", "bts3", "bts4", "bts5", "bts6", "bts7"]
    
    // Property Observer 활용 (index 값이 바뀌었을 때마다 changeImage() 를 실행함
    // didSet : 바뀐 이후 값이 중요하면 (바뀐 이후에 실행)
    // willSet : 바뀌기 전 값이 중요하면 (바뀌기전에 실행)
    var index = 0 {
        didSet {
            changeImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = btsImages.count // pageControl 의 총 페이지 개수 설정
        prevButton.isEnabled = false // 이전버튼 비활성화
    }
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        index -= 1
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        index += 1
    }
    
    func changeImage() {
        pageControl.currentPage = index
        
        nextButton.isEnabled = true
        prevButton.isEnabled = true
        
        indexLabel.text = "\(index + 1) / \(btsImages.count)"
        
        if index == btsImages.count - 1 { // 마지막 사진일 때
            nextButton.isEnabled = false
        }
        
        if index == 0 { // 첫 번째 사진일 때
            prevButton.isEnabled = false
        }
        imageView.image = UIImage(named: btsImages[index]) // btsImages의 배열의 index 번째 이미지를 삽입
    }
    
    // PageControl 에서 value가 변경되면 실행됨
    // index에 sender의 currentPage 값을 담는다.
    @IBAction func changePage(_ sender: UIPageControl) {
        index = sender.currentPage
//         or 아래도 동일하게 동작함 
//        index = pageControl.currentPage
    }
}
