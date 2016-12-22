//
//  ItemTableViewCell.swift
//  GlooxyPlus
//
//  Created by Franco on 22/12/16.
//  Copyright © 2016 Telecom Italia. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var GLimageView: UIImageView!

    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
   
    @IBOutlet weak var heartP: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        GLimageView.addGestureRecognizer(tap)
    }
    
    
    func doubleTapped()
    {
        heartP.isHidden = false
                UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIViewKeyframeAnimationOptions.allowUserInteraction, animations: {
                    self.heartP.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.heartP.alpha = 1.0
                }, completion: { (end) in
                    UIView.animateKeyframes(withDuration: 0.1, delay: 0, options: UIViewKeyframeAnimationOptions.allowUserInteraction, animations: {
                        self.heartP.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
                    }, completion: { (end) in
                        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIViewKeyframeAnimationOptions.allowUserInteraction, animations: {
                            self.heartP.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                        }, completion: { (end) in
                            self.heartP.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                            self.heartP.isHidden = true
                        })
                    })
                })
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
