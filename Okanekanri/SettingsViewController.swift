//
//  SettingsViewController.swift
//  Okanekanri
//
//  Created by 児玉美穂 on R 5/05/24.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var purposeTextField: UITextField!
   
    @IBOutlet var addButton: UIButton!
    @IBOutlet var incomeButton : UIButton!
    @IBOutlet var expenseButton : UIButton!
    var datePicker: UIDatePicker = UIDatePicker()
    
    var saveData: UserDefaults = UserDefaults.standard

    var dates : [String] = []
    var amounts : [String] = []
    var purposes : [String] = []
    var signs : [String] = []
    var sign : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    saveData.register(defaults: ["dates":[], "amounts":[], "purposes":[]])
        
        dates = (saveData.array(forKey: "dates") ?? []) as! [String]
        amounts = (saveData.array(forKey: "amounts") ?? []) as! [String]
        purposes = (saveData.array(forKey: "purposes") ?? []) as! [String]
        signs = (saveData.array(forKey: "signs") ?? []) as! [String]
        
                //print(date)
        
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dateTextField.inputView = datePicker
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
        
        var dateTextFieldValue: String = ""
        dateTextFieldValue = dateTextField.text!
    dates.append("\(dateTextFieldValue)")
        
        UserDefaults.standard.set(dates, forKey: "1")
        
        dateTextField.delegate = self
        
        }
   
    @objc func done(){
        dateTextField.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy,MM-dd"
        dateTextField.text = "\(formatter.string(from: Date()))"
    }
    
    @IBAction func saveMemo(_ sender: Any){
        let date = dateTextField.text
        let amount = amountTextField.text
        let purpose = purposeTextField.text
        
//        saveData.set(dateTextField.text, forKey: "date")
//        saveData.set(amountTextField.text, forKey: "amount")
//        saveData.set(purposeTextField.text, forKey: "purpose")
        
        saveData.set(dates, forKey: "dates")
        saveData.set(amounts, forKey: "amounts")
        saveData.set(purposes, forKey: "purposes")
        
        dates.append(date!)
        purposes.append(purpose!)
        amounts.append(amount!)
        signs.append(sign)
        
        let vc = presentingViewController as! ViewController
        
        vc.refreshTableView()
        
        self.dismiss(animated: true)
//        print(date)
//        print(amount)
//        print(purpose)
        
   
    }
    @IBAction func income(){
        incomeButton.backgroundColor = UIColor(red: 0.37, green: 0.36, blue: 0.9, alpha: 1.0)
        expenseButton.backgroundColor = UIColor.white
        incomeButton.setTitleColor(UIColor.white, for: .normal)
        sign = "+"
    }
    @IBAction func expense(){
        expenseButton.backgroundColor = UIColor(red: 0.37, green: 0.36, blue: 0.9, alpha: 1.0)
        incomeButton.backgroundColor = UIColor.white
        expenseButton.setTitleColor(UIColor.white, for: .normal)
        sign = "-"
    }
    @IBAction func dismiss(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     */

}
