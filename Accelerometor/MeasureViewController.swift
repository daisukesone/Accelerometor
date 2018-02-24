//
//  MeasureViewController.swift
//  Accelerometor
//
//  Created by 曽根大輔 on 2018/02/23.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import CoreMotion

class MeasureViewController: UIViewController {
    
    @IBOutlet var awaImageView: UIImageView!
    
    var accelerationX: Double!
    
    let motionManager = CMMotionManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable{
            
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data,
            error) in
            self.accelerationX = (data?.acceleration.x)!
            self.awaImageView.center.x  =
                self.awaImageView.center.x - CGFloat(self.accelerationX*20)
            
                if self.awaImageView.frame.origin.x < 40{
                    self.awaImageView.frame.origin.x = 40
                }
                if self.awaImageView.frame.origin.x > 260{
                    self.awaImageView.frame.origin.x = 260
                    
                }
                
            })
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
