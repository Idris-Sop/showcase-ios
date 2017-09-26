//
//  AboutViewController.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/19.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class AboutViewController: DVTShowcaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var aboutTableView: UITableView?
    private var aboutView: AboutView?

    private let aboutDVT = "DVT or Dynamic Visual Technologies was founded in 1999. It has grown to over 600 staff with offices in South Africa (Johannesburg, Centurion, Cape Town and Durban) and the United Kingdom (London). We service more than 100 local nd international, medium and large organisations and build long-tem partnerships with our clients."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "About"
        self.aboutTableView?.delegate = self
        self.aboutTableView?.dataSource = self
        self.aboutTableView?.rowHeight = UITableViewAutomaticDimension
        self.aboutTableView?.estimatedRowHeight = 130
        self.aboutTableView?.register(UINib.init(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutCellIdentifier")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCellIdentifier", for: indexPath) as! AboutTableViewCell
        cell.layer.cornerRadius = 2.0
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        cell.aboutLabel.text = self.aboutDVT
        cell.websiteButton.addTarget(self, action: #selector(openWebsitePressed(sender:)), for: .touchUpInside)
        cell.websiteIconButton.addTarget(self, action: #selector(openWebsitePressed(sender:)), for: .touchUpInside)
        cell.websiteButton.tag = indexPath.section
        cell.websiteIconButton.tag = indexPath.section

        cell.twitterButton.addTarget(self, action: #selector(openTwitterPressed(sender:)), for: .touchUpInside)
        cell.twitterIconButton.addTarget(self, action: #selector(openTwitterPressed(sender:)), for: .touchUpInside)
        cell.twitterButton.tag = indexPath.section
        cell.twitterIconButton.tag = indexPath.section

        cell.facebookButton.addTarget(self, action: #selector(openFacebookPressed(sender:)), for: .touchUpInside)
        cell.facebookIconButton.addTarget(self, action: #selector(openFacebookPressed(sender:)), for: .touchUpInside)
        cell.facebookButton.tag = indexPath.section
        cell.facebookIconButton.tag = indexPath.section
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let aboutDVTText = self.aboutDVT
        return 130 + heightForText(text: aboutDVTText)
    }
    
    func heightForText(text: String) -> CGFloat {
        let MAX_HEIGHT = 20000
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: MAX_HEIGHT))
        textView.text = text
        textView.font = UIFont.boldSystemFont(ofSize: 17)
        textView.sizeToFit()
        return textView.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.aboutTableView!.frame.size.width, height: 170.0))
        headerView.layer.cornerRadius = 2.0
        headerView.layer.borderWidth = 0.5
        headerView.layer.borderColor = UIColor.lightGray.cgColor
        headerView.backgroundColor = DVTShowcaseColor.lightGray
        let imgView = UIImageView(frame: headerView.frame)
        imgView.image = UIImage(named: "dvt_tagline")
        headerView.addSubview(imgView)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 170.0
    }
    
    func openWebsitePressed(sender: UIButton) {
        self.openWebsite(withUrl: "http://www.dvt.co.za/")
    }
    
    func openTwitterPressed(sender: UIButton) {
        self.openDVTTwitter()
    }
    
    func openFacebookPressed(sender: UIButton) {
        self.openDVTFacebook()
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
