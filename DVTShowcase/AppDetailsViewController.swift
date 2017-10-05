//
//  AppDetailsViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/29.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

enum AppDetailsContent: String {
    case HeaderDetails = "Header Details"
    case ScreenShots = "SCREENSHOTS"
    case Functionality = "FUNCTIONALITY"
    case Technology = "TECHNOLOGY"
}


class AppDetailsViewController: DVTShowcaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var detailsTableView: UITableView!
    var selectedApp: DVTApp!
    let firebaseApi = FirebaseAPI.sharedFirebaseAPI
    var contentParts:[(String,[AppDetailsContent])] = [("",[.HeaderDetails]), ("ScreenShots",[.ScreenShots]), ("Functionality",[.Functionality]), ("",[.Technology])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = DVTShowcaseColor.blueColor
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        let imge = UIImage(named: "arrow_back")
        let backButton = UIBarButtonItem(image: imge, style: UIBarButtonItemStyle.plain, target: self, action: #selector(dismissViewController(sender:)))
        backButton.tintColor = UIColor.white
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        
        self.detailsTableView?.delegate = self
        self.detailsTableView?.dataSource = self
        self.detailsTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        self.detailsTableView?.rowHeight = UITableViewAutomaticDimension
        self.detailsTableView?.estimatedRowHeight = 170
        self.detailsTableView?.register(UINib.init(nibName: "HeaderDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "headerDetailsTableViewCell")
        self.detailsTableView?.register(UINib.init(nibName: "FunctionalityTableViewCell", bundle: nil), forCellReuseIdentifier: "functionalityTableViewCell")
        self.detailsTableView?.register(UINib.init(nibName: "ScreenshotsTableViewCell", bundle: nil), forCellReuseIdentifier: "screenshotsTableViewCell")
        self.detailsTableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellIdentifier")
    }
    
    func setSelectedDVTApp(dvtApp: DVTApp) {
        self.selectedApp = dvtApp
        self.navigationItem.title = self.selectedApp.appName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contentParts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        let section = self.contentParts[(indexPath as NSIndexPath).section]
        let content = section.1[(indexPath as NSIndexPath).row]
        
        switch(content) {
        case .HeaderDetails:
            let customCell = tableView.dequeueReusableCell(withIdentifier: "headerDetailsTableViewCell", for: indexPath) as! HeaderDetailsTableViewCell
            customCell.appNameLabel.text = self.selectedApp.appName
            customCell.clientNameLabel.text = self.selectedApp.client
            customCell.shortDescriptionLabel.text = self.selectedApp.shortDescription
            customCell.installButton.layer.cornerRadius = 5.0
            if ((self.selectedApp.iconUrl) != nil) {
                firebaseApi.getIconImage(iconUrl: self.selectedApp.iconUrl) { (success, image, message) in
                    if success {
                        customCell.appIconImageView.image = image
                    }
                }
            }
            cell = customCell
        case .ScreenShots:
            if ((self.selectedApp.screenShots?.count) != nil) {
                let customCell = tableView.dequeueReusableCell(withIdentifier: "screenshotsTableViewCell", for: indexPath) as! ScreenshotsTableViewCell
                customCell.setSelectedDVTApp(dvtApp: self.selectedApp)
                cell = customCell
            } else {
                let customCell = tableView.dequeueReusableCell(withIdentifier: "functionalityTableViewCell", for: indexPath) as! FunctionalityTableViewCell
                customCell.functionalityLabel.text = "None"
                cell = customCell
            }
            
        case .Functionality:
            let customCell = tableView.dequeueReusableCell(withIdentifier: "functionalityTableViewCell", for: indexPath) as! FunctionalityTableViewCell
            customCell.functionalityLabel.text = self.selectedApp.functionality
            cell = customCell

        case .Technology:
            let customCell = tableView.dequeueReusableCell(withIdentifier: "functionalityTableViewCell", for: indexPath) as! FunctionalityTableViewCell
            customCell.functionalityLabel.text = self.selectedApp.technologyUsed
            cell = customCell
        }
        return cell!;
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = self.contentParts[(indexPath as NSIndexPath).section]
        let content = section.1[(indexPath as NSIndexPath).row]

        switch(content) {
        case .ScreenShots:
            if ((self.selectedApp.screenShots?.count) != nil) {
                return 250.0
            } else {
                return 0.0
            }
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let headerTitle : String?
        let sectionn = self.contentParts[section]
        let content = sectionn.1[0]
        
        switch(content) {
        case .HeaderDetails:
            headerTitle = ""
        case .ScreenShots:
            if ((self.selectedApp.screenShots?.count) != nil) {
                headerTitle = "SCREENSHOTS"
            } else {
                return nil
            }
        case .Functionality:
            headerTitle = "FUNCTIONALITY"
        case .Technology:
            headerTitle = "TECHNOLOGY"
        }
        return headerTitle
    }

    func dismissViewController(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
