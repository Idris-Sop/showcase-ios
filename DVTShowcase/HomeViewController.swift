//
//  HomeViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/19.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit


class HomeViewController: DVTShowcaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var showcaseAppTableView: UITableView!

    var showcaseAppArray = [AnyObject?]()
    let firebaseApi = FirebaseAPI.sharedFirebaseAPI
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let narBArImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        narBArImageView.image = UIImage(named: "dvt_icon")
        self.navigationItem.title = "DVT App Showcase"
        self.showcaseAppTableView?.delegate = self
        self.showcaseAppTableView?.dataSource = self
        self.showcaseAppTableView?.rowHeight = UITableViewAutomaticDimension
        self.showcaseAppTableView?.estimatedRowHeight = 110
        self.showcaseAppTableView?.register(UINib.init(nibName: "ShowcaseAppTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowcaseAppCellIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//            self.showLoading(view: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        firebaseApi.getShowcaseApp { (success, showcaseAppArray, message) in
            if success {
                self.showcaseAppArray = showcaseAppArray
                DispatchQueue.main.async(execute: { () -> Void in
                    self.showcaseAppTableView?.reloadData()
//                    self.hideLoading()
                })
            } else {
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.hideLoading()
//                })
                self.showAlert(title: "Error!", message: message!)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return showcaseAppArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowcaseAppCellIdentifier", for: indexPath) as! ShowcaseAppTableViewCell

        let showcaseApps = showcaseAppArray[indexPath.section] as? DVTApp
        cell.appNameLabel.text = showcaseApps?.appName
        cell.clientNameLabel.text = showcaseApps?.client
        cell.shortDescriptionLabel.text = showcaseApps?.shortDescription
        
        if ((showcaseApps?.iconUrl) != nil) {
            firebaseApi.getIconImage(iconUrl: showcaseApps?.iconUrl) { (success, image, message) in
                if success {
                    cell.appIconImageView.image = image
                }
            }
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedShowcaseApps = showcaseAppArray[indexPath.section] as? DVTApp
        let appDetailsViewController = AppDetailsViewController(nibName: "AppDetailsViewController", bundle: Bundle.main)
        appDetailsViewController.setSelectedDVTApp(dvtApp: selectedShowcaseApps!)
        let appDetailsNavigationController = UINavigationController(rootViewController: appDetailsViewController)
        appDetailsNavigationController.navigationBar.barTintColor = DVTShowcaseColor.blueColor
        self.present(appDetailsNavigationController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(appDetailsViewController, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
