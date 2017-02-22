//
//  Profile3Controller.swift
//  maqueta
//
//  Created by Miguel Roncallo on 2/22/17.
//  Copyright © 2017 Nativapps. All rights reserved.
//

import UIKit

class Profile3Controller: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var goalsTextField: UITextField!
    
    @IBOutlet var subGoalsTextField: UITextField!

    
    var goalPicker = UIPickerView()
    var subGoalPicker = UIPickerView()
    
    let goals = ["Goal 1","Goal 2","Goal 3"]
    let subGoals = ["SubGoal 1","SubGoal 2","SubGoal 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.goalPicker.tag = 1
        self.subGoalPicker.tag = 2
        
        setNavigationBar()
        setTextFields()
        
        self.goalPicker.delegate = self
        self.subGoalPicker.delegate = self
        // Do any additional setup after loading the view.
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
            //Goals
            return self.goals.count
            
        case 2:
            //Sub Goals
            return self.subGoals.count
            
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            //Goals
            return self.goals[row]
            
        case 2:
            //Sub Goals
            return self.subGoals[row]
            
        default:
            break
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch pickerView.tag {
            
        case 1:
            //Goals
            self.goalsTextField.text = self.goals[row]
            
        case 2:
            //Sub Goals
            self.subGoalsTextField.text = self.subGoals[row]
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
        self.goalsTextField.layer.borderColor = UIColor.white.cgColor
        self.subGoalsTextField.layer.borderColor = UIColor.white.cgColor
        
        self.goalsTextField.inputView = self.goalPicker
        self.subGoalsTextField.inputView = self.subGoalPicker
        
    }

}
