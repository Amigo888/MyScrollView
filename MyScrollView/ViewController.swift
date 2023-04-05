//
//  ViewController.swift
//  MyScrollView
//
//  Created by Дмитрий Процак on 06.04.2023.
//

import UIKit

class ViewController: UIViewController {
    private let swipeableView: UIView = {
            let view = UIView(frame: CGRect(origin: .zero,
                                            size: CGSize(width: 400.0, height: 300.0)))
            view.backgroundColor = .blue
            view.translatesAutoresizingMaskIntoConstraints = false

            return view
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(swipeableView)

        view.backgroundColor = .white
        
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
}
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {

        var frame = swipeableView.frame

        switch sender.direction {
        case .up:
            frame.origin.y -= 100.0
        case .down:
            frame.origin.y += 100.0
        default:
            break
        }

        UIView.animate(withDuration: 0.25) {
            self.swipeableView.frame = frame
        }
    }
    
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
}

