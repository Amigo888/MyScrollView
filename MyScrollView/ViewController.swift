//
//  ViewController.swift
//  MyScrollView
//
//  Created by Дмитрий Процак on 06.04.2023.
//

import UIKit

class ViewController: UIViewController {
    private var customScrollView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
        }()
    
    private let subview1: UIView = {
        let view = UIView(frame: CGRect(origin: .init(x: 50, y: 300),
                                        size: CGSize(width: 100.0, height: 100.0)))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private let subview2: UIView = {
        let view = UIView(frame: CGRect(origin: .init(x: 250, y: 200),
                                        size: CGSize(width: 100.0, height: 100.0)))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customScrollView)
        customScrollView.addSubview(subview1)
        customScrollView.addSubview(subview2)
        customScrollView.frame = view.bounds
        
        
        customScrollView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        customScrollView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
}
    
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        
        for i in 0..<customScrollView.subviews.count {
            let subview = customScrollView.subviews[i]
            var frame = subview.frame
            
            switch sender.direction {
            case .up:
                frame.origin.y -= 100.0
            case .down:
                frame.origin.y += 100.0
            default:
                break
            }
            
            
            UIView.animate(withDuration: 0.25) {
                subview.frame = frame
            }
        }
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
}

