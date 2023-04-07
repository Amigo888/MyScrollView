//
//  ViewController.swift
//  MyScrollView
//
//  Created by Дмитрий Процак on 06.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var customScrollView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customScrollView = CustomView()
        customScrollView.frame = view.bounds
        view.addSubview(customScrollView)
        customScrollView.isUserInteractionEnabled = true
    }
}
    



