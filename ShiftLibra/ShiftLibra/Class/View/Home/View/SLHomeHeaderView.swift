//
//  SLHomeHeaderView.swift
//  ShiftLibra
//
//  Created by LUO on 2017/7/24.
//  Copyright © 2017年 JockerLuo. All rights reserved.
//

import UIKit

class SLHomeHeaderView: SLHomeHeaderBackgroundView {
    
    var closure : (()->())?
    
    var homeViewModel : SLHomeViewModel? {
        
        didSet {
            
            update()
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() -> () {
        
        self.addSubview(labLeft)
        
        labLeft.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self)
            
            make.right.equalTo(self.snp.centerX).offset(-labSpace)
        }
        
        self.addSubview(labRight)
        
        labRight.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self)
            
            make.left.equalTo(self.snp.centerX).offset(labSpace)
        }
        
        self.addSubview(btnBack)
        
        btnBack.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(self)
            
            make.left.equalTo(self.snp.left).offset(20)
        }
        
        btnBack.isHidden = true
        
    }
    
    func update() -> () {
        
        labLeft.text = homeViewModel?.fromCurrency?.code
        
        labRight.text = homeViewModel?.toCurrency?.code
    }
    
    @objc fileprivate func btnClick() -> () {
        
        closure?()
    }
    
    fileprivate lazy var labLeft: UILabel = {
        
        let lab = UILabel()
        
        lab.text = "CNY"
        
        lab.font = UIFont.systemFont(ofSize: topFontSize)
        
        lab.textColor = top_left_textColor
        
        lab.sizeToFit()
        
        return lab
    }()
    
    fileprivate lazy var labRight: UILabel = {
        
        let lab = UILabel()
        
        lab.text = "USD"
        
        lab.font = UIFont.systemFont(ofSize: topFontSize)
        
        lab.textColor = top_right_textColor
        
        lab.sizeToFit()
        
        return lab
    }()
    
    lazy var btnBack: UIButton = {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named : "button_back"), for: .normal)
        
        btn.sizeToFit()
        
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        return btn
    }()
    
}
