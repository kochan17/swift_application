//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by 石田幸太 on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var start: UIButton!
    
    
    @IBOutlet weak var stop: UIButton!
    
    var timer = Timer()
    var  count = Int()
    var imageArray = [UIImage]()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        
        for i in 0 ..< 5{
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            
            imageView.image = UIImage(named: "0")
            stop.isEnabled = false
        
        }
        
      
   
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerUpdate(){
        
        count = count + 1
        
        if count > 4 {
            count = 0
        }
        imageView.image = imageArray[count]
    }
    @IBAction func start(_ sender: Any) {
        start.isEnabled = false
        stop.isEnabled = true
        startTimer()
    }
    
    @IBAction func stop(_ sender: Any) {
        
        start.isEnabled = true
        stop.isEnabled = false
        
        timer.invalidate()

    }
}

