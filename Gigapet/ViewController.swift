//
//  ViewController.swift
//  Gigapet
//
//  Created by Andrew Ingram on 2016-02-29.
//  Copyright © 2016 Sabring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImage: MonsterImage!
    @IBOutlet weak var foodImage: DragImage!
    @IBOutlet weak var heartImage: DragImage!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    

    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_SKULL = 3
    
    var skull = 0
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImage.dropTarget = monsterImage
        heartImage.dropTarget = monsterImage
        
        skull1.alpha = DIM_ALPHA
        skull2.alpha = DIM_ALPHA
        skull3.alpha = DIM_ALPHA

        NSNotificationCenter.defaultCenter().addObserver(self,selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
    
        startTimer()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
        
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImage.playDeadAnimation()
        
    }
    
    func changeGameState() {
        skull++
        
        if skull == 1 {
            skull1.alpha = OPAQUE
            skull2.alpha = DIM_ALPHA
        } else if skull == 2 {
            skull2.alpha = OPAQUE
            skull3.alpha = DIM_ALPHA
        } else if skull >= 3 {
            skull3.alpha = OPAQUE
        } else {
            skull1.alpha = DIM_ALPHA
            skull2.alpha = DIM_ALPHA
            skull3.alpha = DIM_ALPHA
        }
        
        if skull >= MAX_SKULL {
            gameOver()
        }
    }
    

}

