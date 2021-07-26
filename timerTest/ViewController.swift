//
//  ViewController.swift
//  timerTest
//
//  Created by MoonCat on 2021/7/23.
//

import UIKit
import os

class ViewController: UIViewController {
    
    // For timer print tesr
    var indexForTest: Int = 0
    var timer: Timer?
    // Logger 比較方便看時間，記得 import oss
    let logger = Logger()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTapAction()
        callTimer()
    }

    /**
     預設為 true 代表第一次點擊目的為 pause
     若為 false 代表點擊目的為啟動 timer
     */
    var pasue : Bool = true
    
    @objc func tapScreen(){
//        print("tapScreen")
        if pasue == true{
            // pause
            print("pause")
            timer?.invalidate()
        }else{
            // play
            print("play")
            callTimer()
        }
        pasue = !pasue
    }
    
    func callTimer(){
        /**
         這段在你的問題其實應該是不用寫，不過可以防呆
         我原本專案的目的是點擊在畫面上會重置 timer 時間
         */
        if timer != nil{
            timer?.invalidate()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { Timer in
            // Do something here
            self.logger.log("\(self.indexForTest)")
            // 簡單弄一個 0-5 的 timer print test
            self.indexForTest = self.indexForTest == 5 ? 0 : self.indexForTest + 1
        })
    }
    
    /// 不重要 set tap view action
    func setTapAction(){
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        gesture.numberOfTapsRequired = 1
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
    }
}

