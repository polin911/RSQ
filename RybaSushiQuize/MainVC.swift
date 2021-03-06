//
//  MainVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring
import RazzleDazzle

class MainVC: AnimatedPagingScrollViewController {

    @IBOutlet var sprView: SpringImageView!
    @IBOutlet var txtFirstImg: UIImageView!
    @IBOutlet var semenSecImg: UIImageView!
    @IBOutlet var btnEnter: UIButton!
    @IBOutlet var pageCont: UIPageControl!
    @IBOutlet var viewLine: UIView!
    @IBOutlet var bubleTxtImg: UIImageView!
    @IBOutlet var sprFeliksTalk: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sprAnimation()
        razDaz()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageCont.currentPage = Int(pageOffset + 0.5)
    }
    override func numberOfPages() -> Int {
        return 4
    }
    
    func razDaz() {
        
        
        contentView.addSubview(sprView)
        contentView.addSubview(txtFirstImg)
        contentView.addSubview(semenSecImg)
        contentView.addSubview(btnEnter)
        contentView.addSubview(pageCont)
        contentView.addSubview(sprFeliksTalk)
        
        contentView.addSubview(bubleTxtImg)

        
        
        contentView.addConstraint(NSLayoutConstraint(item: txtFirstImg, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: semenSecImg, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
        
        contentView.addConstraint(NSLayoutConstraint(item: bubleTxtImg, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: sprFeliksTalk, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0))
        
        keepView(sprView, onPages: [0,1,2,3])
        keepView(txtFirstImg, onPage: 0)
        keepView(semenSecImg, onPage: 2)
        keepView(bubleTxtImg, onPage: 1)
        keepView(sprFeliksTalk, onPage: 3)
       // keepView(btnEnter, onPages: [0,1,2,3,4])
    }
    
    func sprAnimation() {
        sprView.animation = "fadeIn"
        sprView.duration = 15
        sprView.animate()
        

    }

   
}
