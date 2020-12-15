//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 増田 一樹 on 2020/12/15.
//  Copyright © 2020 Kazuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var moveButton: UIButton!
    
    @IBOutlet weak var returnButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "dog1")!,
        UIImage(named: "dog2")!,
        UIImage(named: "dog3")!
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imageArray[nowIndex]
    }
    
    //進むを押したとき
    @IBAction func moveButton(_ sender: Any) {
        changeImage()
    }
    
    //戻るを押したとき
    @IBAction func returnButton(_ sender: Any) {
        changeImage2()
    }
    
    //再生ボタンを押した時
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
          if (timer == nil) {
              // 再生時の処理を実装

              // タイマーをセットする
              timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

              // ボタンの名前を停止に変える
              startButton.setTitle("停止", for: .normal)
            
             //進むボタンと戻るボタンを非活性にする
              moveButton.isEnabled = false
              returnButton.isEnabled = false

          } else {
              // 停止時の処理を実装
              // タイマーを停止する
              timer.invalidate()

              // タイマーを削除しておく
              timer = nil

              // ボタンの名前を再生に直しておく
              startButton.setTitle("再生", for: .normal)
            
              //進むボタンと戻るボタンを活性にする
               moveButton.isEnabled = true
               returnButton.isEnabled = true
          }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func changeImage2() {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1

        // indexが最初の数字になったとき
        if (nowIndex == -1) {
            // indexを一番最後の数字に戻す
            nowIndex = 2
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func tapAction(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: self.nowIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let ResultViewController:ResultViewController = segue.destination as! ResultViewController
            ResultViewController.nowIndex = self.nowIndex
        
    }
}

