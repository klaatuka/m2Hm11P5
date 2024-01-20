//
//  ViewController.swift
//  m2Hm11P5
//
//  Created by Давид Узунян on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label1: UILabel = {
        $0.backgroundColor = .yellow
        $0.text = "  text"
        $0.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
        return $0
    }(UILabel())
    lazy var label2: UILabel = {
        $0.backgroundColor = .yellow
        $0.text = "  text"
        $0.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        return $0
    }(UILabel())
    lazy var label3: UILabel = {
        $0.backgroundColor = .yellow
        $0.text = "  text"
        $0.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        return $0
    }(UILabel())
    lazy var label4: UILabel = {
        $0.backgroundColor = .yellow
        $0.text = "  text"
        $0.frame = CGRect(x: 50, y: 400, width: 100, height: 50)
        return $0
    }(UILabel())
    lazy var label5: UILabel = {
        $0.backgroundColor = .yellow
        $0.text = "  text in 1"
        $0.frame = CGRect(x: view.center.x, y: view.center.y, width: 100, height: 50)
        return $0
    }(UILabel())
    lazy var firstView: UIView = {
        $0.backgroundColor = .green
        $0.frame = view.bounds
        $0.addSubview(label1)
        $0.addSubview(label2)
        $0.addSubview(label3)
        $0.addSubview(label4)
        return $0
    }(UIView())
    
    lazy var secondView: UIView = {
        $0.backgroundColor = .blue
        $0.frame = view.bounds
        $0.addSubview(label5)
        $0.addSubview(btn)
        return $0
    }(UIView())
    
    lazy var btn: UIButton = {
        $0.frame = CGRect(x: view.center.x, y: 600, width: 100, height: 50)
        $0.setTitle("PRESS", for: .normal)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: btnAction))
    
    lazy var btnAction = UIAction { _ in
        print(1)
        UIView.animate(springDuration: 0.4, animations: {
            if self.secondView.frame == self.view.bounds{
                self.secondView.frame.origin.x = 200
            } else {
                self.secondView.frame = self.view.bounds
            }
         
        })
    }
    
    lazy var swipeGesture1: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        gesture.direction = .right
        return gesture
    }()
    lazy var swipeGesture2: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction2(_:)))
        gesture.direction = .left
        return gesture
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addGestureRecognizer(swipeGesture1)
        view.addGestureRecognizer(swipeGesture2)
    }
    
    @objc func swipeAction(_ gesture: UISwipeGestureRecognizer) {
        print(1)
        UIView.animate(withDuration: 0.4, animations: {
            self.secondView.frame.origin.x = 200
        })
    }
    
    @objc func swipeAction2(_ gesture: UISwipeGestureRecognizer) {
        print(1)
        UIView.animate(withDuration: 0.4, animations: {
            self.secondView.frame = self.view.bounds
        })
    }
}

