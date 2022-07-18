//
//  LoadingViewController.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit
enum segment {
    case x, y, h
}

class LoadingViewController: UIViewController {
    let textLabel = UILabel()
    lazy var shadowView: UIView = {
        let viewLabel = UIView()
        viewLabel.frame = view.bounds
        viewLabel.alpha = 0.90
        viewLabel.backgroundColor = UIColor(named: "ColorDark")
        return viewLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        rightShadow()
        setupTextLabelLayout()
    }
}

