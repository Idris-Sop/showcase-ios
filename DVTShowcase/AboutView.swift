//
//  AboutView.swift
//  DVTShowcase
//
//  Created by Idris SOP on 2017/09/26.
//  Copyright © 2017 DVT. All rights reserved.
//

import UIKit

class AboutView: UIView {

    var view:UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("AboutView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

public extension UIView {
    public class func loadFromNibNamed(_ nibNamed: String, bundle: Bundle? = Bundle(for: classForCoder()), frame: CGRect? = CGRect.zero) -> UIView? {
        let nibView = UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
        if frame != nil {
            nibView?.frame = frame!
            nibView?.translatesAutoresizingMaskIntoConstraints = true
        }
        return nibView
    }
}
