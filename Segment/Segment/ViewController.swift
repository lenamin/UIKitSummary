//
//  ViewController.swift
//  Segment
//
//  Created by Lena on 8/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentControl.setTitle("네번째", forSegmentAt: 3)
        segmentControl.setEnabled(false, forSegmentAt: 2)
        segmentControl.selectedSegmentIndex = 1
        
        slider.maximumValue = 100
        slider.minimumValue = -100
        slider.value = 0
        
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 0.2
        stepper.value = 0
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func actChange(_ sender: Any) {
        label1.text = "\(segmentControl.selectedSegmentIndex + 1)번째를 눌러주었습니다."
    }
    
    @IBAction func didEndOnExit(_ sender: Any) {
        label1.text = textField.text
    }
    
    @IBAction func actSliderValueChange(_ sender: Any) {
        label1.text = "\(slider.value)"
    }
    
    @IBAction func actSwitch(_ sender: Any) {
        if switch1.isOn {
            label1.text = "스위치가 켜졌습니다."
        } else {
            label1.text = "스위치가 꺼졌습니다."
        }
    }
    
    @IBAction func actStepperValueChanged(_ sender: Any) {
        label1.text = "\(stepper.value)"
    }
}

