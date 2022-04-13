//
//  EditViewController.swift
//  StudyMate
//
//  Created by Haonan Wang on 4/7/22.
//

import UIKit
import Parse
import AlamofireImage

class EditViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearSegmented: UISegmentedControl!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFields()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSave(_ sender: Any) {
        let profileInfo = PFObject(className: "Profile")
        var saved = true
        
        if nameTextField.hasText {
            profileInfo["preferredName"] = nameTextField.text!
        } else {
            saved = false
            nameTextField.textColor = UIColor.red
            nameTextField.text = "Empty name"
        }
        
        if majorTextField.hasText {
            profileInfo["major"] = majorTextField.text!
        } else {
            saved = false
            majorTextField.textColor = UIColor.red
            majorTextField.text = "Empty major"
        }
        
        if universityTextField.hasText {
            profileInfo["university"] = universityTextField.text!
        } else {
            saved = false
            universityTextField.textColor = UIColor.red
            universityTextField.text = "Empty university"
        }
        
        if bioTextView.hasText {
            profileInfo["biography"] = bioTextView.text!
        } else {
            saved = false
            bioTextView.textColor = UIColor.red
            bioTextView.text = "Empty introduction"
        }
        
        // TODO: profile["name"] = PFUser.current()
        
        let segmentIndex = yearSegmented.selectedSegmentIndex
        UserDefaults.standard.set(segmentIndex, forKey: "segmentIndex")
        profileInfo["year"] = yearSegmented.titleForSegment(at: segmentIndex)!
        
        guard let image = profileImage.image?.pngData() else { return }
        let imageFile = PFFileObject(name: "profileImage.png", data: image)
        profileInfo["image"] = imageFile
        
        if saved {
            //profile.add(profileInfo, forKey: "info")
            profileInfo.saveInBackground { (succeeded, error) in
                if succeeded {
                    UserDefaults.standard.set(true, forKey: "hasProfile")
                    UserDefaults.standard.set(profileInfo.objectId, forKey: "profileId")
                    print("saved")
                } else {
                    UserDefaults.standard.set(false, forKey: "hasProfile")
                    print("failed to save info")
                }
                
            }
        } else {
            print("nil so failed to save")
        }
    }
    
    @IBAction func onSelectImage(_ sender: Any) {
        // select image and show in imageView
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 414, height: 360)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        profileImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func initializeFields() {
        bioTextView.layer.borderColor = UIColor.lightGray.cgColor
        bioTextView.layer.borderWidth = 0.5
        bioTextView.layer.cornerRadius = 5.0
        nameTextField.textColor = UIColor.black
        majorTextField.textColor = UIColor.black
        bioTextView.textColor = UIColor.black
        print("initialized")
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
