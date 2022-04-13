//
//  ProfileViewController.swift
//  StudyMate
//
//  Created by Haonan Wang on 4/7/22.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "hasProfile") {
            showProfile()
        } else {
            self.nameLabel.text = "No name"
            self.majorLabel.text = "No major"
            self.yearLabel.text = "No year"
            self.bioLabel.text = "No biography"
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidLoad()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        // TODO: waiting for login view controller
        // MARK: used to logout and return to login view when clicked
    }
    
    func showProfile() {
        let query = PFQuery(className: "Profile")
        query.getObjectInBackground(withId: UserDefaults.standard.string(forKey: "profileId")!) {
            (profile, error) in
            if error == nil {
                self.nameLabel.text = profile!["prefferedName"] as? String
                self.yearLabel.text = profile!["year"] as? String
                self.majorLabel.text = profile!["major"] as? String
                self.bioLabel.text = profile!["biography"] as? String
                
                let imageFile = profile!["image"] as? PFFileObject
                imageFile!.getDataInBackground {(imageData: Data?, error: Error?) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    else if let imageData = imageData {
                        let image = UIImage(data: imageData)
                        self.profileImage.image = image
                    }
                }
            } else {
                self.nameLabel.text = "No name"
                self.majorLabel.text = "No major"
                self.yearLabel.text = "No year"
                self.bioLabel.text = "No biography"
            }
        }
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

// MARK: currently using a singleton implementation to save profile info globally
// TODO: need a way to fetch other users profile info, don't know if this would work
class ProfileInfo {
    static let userProfile = ProfileInfo()
    
    var name: String
    var year: String
    var major: String
    var introduction: String
    
    private init() {
        self.name = "None (name)"
        self.year = "None (class year)"
        self.major = "None (major)"
        self.introduction = "None (brief introduction)"
    }
    
    // MARK: maybe image should also be included and decided here?
}
