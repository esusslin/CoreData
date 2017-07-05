//
//  ViewController.swift
//  CoreData
//
//  Created by Emmet Susslin on 7/4/17.
//  Copyright © 2017 Emmet Susslin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isGraphViewShowing = false
    
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("graph view")
        print(graphView.center)
        
        print("counter! view")
        print(counterView.center)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPushButton(button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing {
            counterViewTap(gesture: nil)
        }
    }
    
    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            
            //hide Graph
            UIView.transition(from: graphView,
                              to: counterView,
                                      duration: 1.0,
                                      options: [.transitionFlipFromLeft, .showHideTransitionViews],
                                      completion:nil)
        } else {
            
            //show Graph
            UIView.transition(from: counterView,
                              to: graphView,
                                      duration: 1.0,
                                      options: [.transitionFlipFromLeft, .showHideTransitionViews],
                                      completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }

}

