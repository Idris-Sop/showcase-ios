//
//  ScreenshotsTableViewCell.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/10/03.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class ScreenshotsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var screenShotsCollectionView: UICollectionView!
    var selectedApp: DVTApp!
    var screenShotsArray: [String]?
    let firebaseApi = FirebaseAPI.sharedFirebaseAPI
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.screenShotsCollectionView?.delegate = self
        self.screenShotsCollectionView?.dataSource = self
       
        self.screenShotsCollectionView?.register(UINib.init(nibName: "ScreenShotsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "screenShotsCollectionViewCell")
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:5,left:0,bottom:5,right:5)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: 140  , height: (self.frame.size.height - 10))
        self.screenShotsCollectionView?.collectionViewLayout = layout
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 2.0
        self.layer.borderWidth = 0.5
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSelectedDVTApp(dvtApp: DVTApp) {
        self.selectedApp = dvtApp
        screenShotsArray = self.selectedApp.screenShots
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return (screenShotsArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellOfCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "screenShotsCollectionViewCell", for: indexPath) as! ScreenShotsCollectionViewCell
        
        var screenShotUrl : String?
        screenShotUrl = screenShotsArray?[indexPath.section]
        if (screenShotUrl != nil) {
            firebaseApi.getIconImage(iconUrl: screenShotUrl) { (success, image, message) in
                if success {
                    cellOfCollection.screenShotImageView.image = image
                }
            }
        }
        
        return cellOfCollection
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
