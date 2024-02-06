//
//  ViewController.swift
//  PickerView
//
//  Created by ANDREW KAISER on 2/1/24.
//

import UIKit
 // needs to adopt pickerViewDelegate and dataSource
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    @IBOutlet weak var pickerOutlet: UIPickerView!
    
    var foods = ["Apple", "Steak", "Fries", "Burger", "Tenders"]
    var selectedFood = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerOutlet.delegate = self
    }
    
    // number of wheels/componets you have
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // how many rows within your wheel
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return foods.count
        }
        return 0
    }
    // sets a title for each row in your wheel
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return foods[row]
        }
        return ""
    }
    // reads what row you stopped on
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectedFood = foods[row]
        }
    }

    @IBAction func submitAction(_ sender: Any) {
        print(selectedFood)
    }
    @IBAction func dateSubmitAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: datePickerOutlet.date)
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: datePickerOutlet.date)
        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: datePickerOutlet.date)
        dateFormatter.dateFormat = "h:mm.ss"
        let time = dateFormatter.string(from: datePickerOutlet.date)

        print("\(month) \(day), \(year) \(time)")
    }
    
}

