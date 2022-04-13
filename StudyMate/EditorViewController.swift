//
//  EditorViewController.swift
//  StudyMate
//
//  Created by Haonan Wang on 4/7/22.
//
/*
import UIKit
import Parse

class EditorViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearSegmented: UISegmentedControl!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bioTextView.layer.borderColor = UIColor.lightGray.cgColor
        bioTextView.layer.borderWidth = 0.5
        bioTextView.layer.cornerRadius = 5.0
        
        if UserDefaults.standard.bool(forKey: "saved") {
            nameTextField.text = ProfileInfo.userProfile.name
            majorTextField.text = ProfileInfo.userProfile.major
            bioTextView.text = ProfileInfo.userProfile.introduction
            yearSegmented.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "sectionIndex")
        } else {
            print("no saved profile")
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: Any) {
        if nameTextField.hasText {
            let name = nameTextField.text
            UserDefaults.standard.set(name, forKey: "name")
        } else {
            nameTextField.textColor = UIColor.systemRed
            nameTextField.text = "Please input a name to save profile"
        }
        
        let whichSection = yearSegmented.selectedSegmentIndex
        let year = yearSegmented.titleForSegment(at: whichSection)
        UserDefaults.standard.set(year, forKey: "classYear")
        UserDefaults.standard.set(true, forKey: "saved")
        UserDefaults.standard.set(whichSection, forKey: "sectionIndex")
        
        if majorTextField.hasText {
            let major = majorTextField.text
            UserDefaults.standard.set(major, forKey: "major")
        } else {
            majorTextField.text = "Please input a major to save profile"
            majorTextField.textColor = UIColor.systemRed
        }
        
        if bioTextView.hasText {
            let introduction = bioTextView.text
            UserDefaults.standard.set(introduction, forKey: "introduction")
            // ProfileInfo.userProfile.introduction = introduction ?? NSAttributedString(string: "failed to pass")
        } else {
            bioTextView.text = "Please input an introduction to save profile"
            bioTextView.textColor = UIColor.systemRed
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} */
