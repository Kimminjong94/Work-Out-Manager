//
//  TimerVC.swift
//  Work-Out Manager
//
//  Created by 김민종 on 2022/09/18.
//

import UIKit

class TimerVC: UIViewController {
    
    var totalSecond: Int = 0 {
        didSet {
            if totalSecond < 1 {
                startButton.isEnabled = false
                resetButton.isHidden = true
                startButton.setTitle("START", for: .normal)
                startButton.backgroundColor = .lightGray


            } else {
                startButton.isEnabled = true
                startButton.backgroundColor = .black
                resetButton.backgroundColor = .black

            }
            secondLabel.text = String(totalSecond)
        }
    }
    var myTimer = Timer()
    var isTimerRunning = false

    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton! {
        
        didSet {
            startButton.isEnabled = false
            startButton.layer.cornerRadius = 15

        }

    }
    @IBOutlet weak var resetButton: UIButton! {
        didSet {
            resetButton.layer.cornerRadius = 15

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isHidden = true
    }

    @IBAction func thirtySecButtonPressed(_ sender: UIButton) {
        totalSecond += 5
    }
    @IBAction func sixtySecButtonPressed(_ sender: UIButton) {
        totalSecond += 60

    }
    @IBAction func hundredButtonPressed(_ sender: UIButton) {
        totalSecond += 120

    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if isTimerRunning == false {
            resetButton.isHidden = false
            startButton.setTitle("PAUSE", for: .normal)
            runTimer()
            isTimerRunning = true
        } else {
            isTimerRunning = false
            myTimer.invalidate()
            startButton.setTitle("START", for: .normal)

        }

       
        
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        totalSecond = 0
        resetButton.isHidden = true
        startButton.setTitle("START", for: .normal)

        
    }
}
