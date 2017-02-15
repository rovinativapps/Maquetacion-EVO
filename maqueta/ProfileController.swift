//
//  ProfileController.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/1/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit
import DropDown

class ProfileController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var contentView: UIView!
    
    @IBOutlet var heightTextField: UITextField!
    
    @IBOutlet var weightTextField: UITextField!
    
    @IBOutlet var heartRateTextField: UITextField!
    
    @IBOutlet var levelTextField: UITextField!
    
    
    var heightPicker = UIPickerView()
    var weightPicker = UIPickerView()
    var heartRatePicker = UIPickerView()
    var levelPicker = UIPickerView()
    
    var heightText = ["150 cm", "151 cm","152 cm","153 cm","154 cm","155 cm","156 cm","157 cm","158 cm",
                      "159 cm","160 cm","161 cm","162 cm","163 cm","164 cm","165 cm","166 cm","167 cm",
                      "168 cm","169 cm","170 cm","171 cm","171 cm","172 cm","173 cm","174 cm","175 cm"]
    
    var weightText = ["65 kg", "66 kg", "67 kg", "68 kg", "69 kg", "70 kg", "71 kg", "72 kg", "73 kg",
                      "74 kg","75 kg","76 kg","77 kg","78 kg","79 kg","80 kg","81 kg","82 kg","83 kg",
                      "84 kg","85 kg"]
    
    var levelText = ["Beginner", "Intermediate", "Expert"]
    
    var bpmText = ["80 bpm", "90 bpm", "100 bpm", "110 bpm", "120 bpm", "130 bpm", "140 bpm", "150 bpm",
                   "160 bpm", "170 bpm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setTextFields()
        
        heightPicker.dataSource = self
        heightPicker.delegate = self
        weightPicker.dataSource = self
        weightPicker.delegate = self
        heartRatePicker.dataSource = self
        heartRatePicker.delegate = self
        levelPicker.dataSource = self
        levelPicker.delegate = self
        
        heightPicker.tag = 1
        weightPicker.tag = 2
        heartRatePicker.tag = 3
        levelPicker.tag = 4
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //PickerView Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            //Height
            return self.heightText.count
            
        case 2:
            //Weight
            return self.weightText.count
        case 3:
            //Heart
            return self.bpmText.count
        case 4:
            //Level
            return self.levelText.count
            
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            //Height
            return self.heightText[row]
            
        case 2:
            //Weight
            return self.weightText[row]
        case 3:
        //Heart
            return self.bpmText[row]
        case 4:
            //Level
            return self.levelText[row]
            
        default:
            break
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch pickerView.tag {
        case 1:
            //Height
             self.heightTextField.text = self.heightText[row]
            
        case 2:
            //Weight
             self.weightTextField.text = self.weightText[row]
        case 3:
            //Heart
            self.heartRateTextField.text = self.bpmText[row]
        case 4:
            //Level
            self.levelTextField.text = self.levelText[row]
            
        default:
            break
        }
        self.view.endEditing(true)

    }
    
    
    
    
    //Supporting functions
    func setNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        let label = UILabel()
        label.text = "PROFILE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.sizeToFit()
        
        
        let saveButton = UIBarButtonItem(title: "NEXT", style: .plain, target: self, action: #selector(self.navigate(_:)))
        
        saveButton.tintColor = UIColor(red: 25/255, green: 90/255, blue: 85/255, alpha: 1.0)
        self.navigationItem.rightBarButtonItems = [saveButton]
        
        
        self.navigationItem.titleView = label
    }
    
    
    func navigate( _ sender: UIBarButtonItem){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profile 2 VC") as! Profile2Controller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setTextFields(){
        heightTextField.layer.borderColor = UIColor.white.cgColor
        weightTextField.layer.borderColor = UIColor.white.cgColor
        heartRateTextField.layer.borderColor = UIColor.white.cgColor
        levelTextField.layer.borderColor = UIColor.white.cgColor
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        heartRateTextField.delegate = self
        levelTextField.delegate = self
        
        heightTextField.inputView = self.heightPicker
        weightTextField.inputView = self.weightPicker
        heartRateTextField.inputView = self.heartRatePicker
        levelTextField.inputView = self.levelPicker
        
    }
}

