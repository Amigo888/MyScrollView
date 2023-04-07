//
//  CustomView.swift
//  MyScrollView
//
//  Created by Дмитрий Процак on 06.04.2023.
//

import UIKit

class CustomView: UIView {
    
    private let subview1: UIView = {
        let view = UIView(frame: CGRect(origin: .init(x: 50, y: 300), size: CGSize(width: 100.0, height: 100.0)))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let subview2: UIView = {
        let view = UIView(frame: CGRect(origin: .init(x: 250, y: 200), size: CGSize(width: 100.0, height: 100.0)))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var offset: CGPoint?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(subview1)
        addSubview(subview2)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .blue
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first!
        if touch.view == self {
            let presentLocation = touch.location(in: self)
            let previousLocation = touch.previousLocation(in: self)
            
            
            let lenghtSwipeX = previousLocation.x - presentLocation.x
            let lenghtSwipeY = previousLocation.y - presentLocation.y
            
            var baseLocationX = self.bounds.origin.x
            var baseLocationY = self.bounds.origin.y
            
            print("lenghtSwipeX - \(lenghtSwipeX)")
            print("lenghtSwipeY - \(lenghtSwipeY)")
            
            UIView.animate(withDuration: 0.1) {
                self.bounds.origin.x = self.bounds.origin.x + lenghtSwipeX
                self.bounds.origin.y = self.bounds.origin.y + lenghtSwipeY
                
//                self.bounds = self.bounds.offsetBy(dx: lenghtSwipeX, dy: lenghtSwipeY)
            }
        }
    }
}
