//
//  ViewController.swift
//  UIKitElementApp
//
//  Created by Евгений Забродский on 19.10.22.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var hideLabel: UILabel!
    @IBOutlet private weak var hideSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      
}

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            infoLabel.text = "The first is a selected"
            infoLabel.textColor = .white
        case 1:
            infoLabel.text = "The second is a selected"
            infoLabel.textColor = .white
        case 2:
            infoLabel.text = "The third is a selected"
            infoLabel.textColor = .white
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        print(slider.value)
        infoLabel.text = String(slider.value)
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        print(sender.text)
    }
    
    @IBAction func buttonAction() {
        print("buttonAction")
        guard let inputText = textField.text, inputText.count > 3 else {
            showAllert(title: "Wrong Format", message: "Enter your name")
            print("Wrong format")
            return
        }
        infoLabel.text = inputText
        textField.text = nil
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        print(sender.date)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        print(sender.isOn)
        segmentedControl.isHidden.toggle()
        infoLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        button.isHidden.toggle()
        datePicker.isHidden.toggle()
        
        hideLabel.text = hideSwitch.isOn ? "Close all elements" : "Show all elements"
    }
    
    private func setupUI() {
        slider.value = 100
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        infoLabel.text =  String(slider.value)
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
        hideSwitch.onTintColor = .red
        hideLabel.text = "Close all elements"
    }


        private func showAllert(title: String, message: String) {
            let allert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet
            )
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.textField.text = "" }
            allert.addAction(okAction)
            present(allert, animated: true)
        }

    
}

