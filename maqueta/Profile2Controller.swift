//
//  Profile2Controller.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/15/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class Profile2Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var timeText = ["30'", "45'","60'","90'","120'"]
    
    var timePicker = UIPickerView()
    
    @IBOutlet var levelTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        timePicker.delegate = self
        timePicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    @IBAction func selectDay(_ sender: UIButton) {
        if sender.titleLabel?.textColor == UIColor.white{
            sender.setTitleColor(UIColor(red: 25/255, green: 90/255, blue: 85/255, alpha: 1.0), for: .normal)
        }else{
            sender.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    //Supporting functions
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "PROFILE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        
        self.navigationItem.titleView = label
        
        self.levelTextField.inputView = timePicker
    }
    
    //PickerView Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.timeText.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return self.timeText[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.levelTextField.text = self.timeText[row]
        self.view.endEditing(true)
        
    }

}
