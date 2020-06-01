//
//  DrawAlert.swift
//  SocialSquid
//
//  Created by Alley Pereira on 5/31/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit


class DrawAlert: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var drawLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DrawAlert", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleHeight , .flexibleWidth ]
    }
}
