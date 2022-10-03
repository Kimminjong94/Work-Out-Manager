//
//  TimerVC + Time.swift
//  Work-Out Manager
//
//  Created by 김민종 on 2022/09/23.
//

import UIKit


extension TimerVC {
    
    //MARK: - 타이머 관련 메소드
    func runTimer() {
            self.myTimer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.updateCounter),
                userInfo: nil,
                repeats: true)
//            self.isTimerRunning = true

    }
    
    @objc func updateCounter() {
        if totalSecond > 0 {
            totalSecond -= 1

            print("\(totalSecond)")
        } else if totalSecond < 1 {
            self.myTimer.invalidate()
            self.startButton.isEnabled = false
            self.startButton.backgroundColor = UIColor.systemGray2
        }
    }
}
