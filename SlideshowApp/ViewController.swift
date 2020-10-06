//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 横道貴浩 on 2020/10/03.
//  Copyright © 2020 横道貴浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //segueにIDを渡す
    @IBAction func tapImage(_ sender: Any) {
        //segueを使用して画面を遷移
        performSegue(withIdentifier: "subNext", sender: nil)
    }
    
    //　outletの接続
    @IBOutlet weak var proeed: UIButton!
    @IBOutlet weak var `return`: UIButton!
    @IBOutlet weak var startStop: UIButton!
    @IBOutlet weak var imageView: UIImageView!
        
    //配列に指定するIndex番号を宣言
    var nowIndex:Int = 0
   
   //スライドショーに使用するタイマーを宣言
   var timer: Timer!
   // スライドショーさせる画像の配列を宣言
   var imageArray: [UIImage] = [
       UIImage(named: "food.1")!,
       UIImage(named: "food.2")!,
       UIImage(named: "food.3")!,
       ]
       
    // 進むボタンで画像を0~2切り替え
    @IBAction func proeed(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
       
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex >= imageArray.count ) {
           // indexを一番最初の数字に戻す
           nowIndex = 0
        }
       // indexの画像をstoryboardの画像にセットする
       imageView.image = imageArray[nowIndex]
    }
    // 戻るボタンで画像を2~0切り替え
    @IBAction func `return`(_ sender: Any) {
         // indexを増やして表示する画像を切り替える
         nowIndex -= 1
         
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex < 0) {
             // indexを一番最初の数字に戻す
             nowIndex = imageArray.count-1
         }
         // indexの画像をstoryboardの画像にセットする
         imageView.image = imageArray[nowIndex]
    
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       // 画像読み込み
         imageView.image = UIImage(named: "food.1")
    }
    //再生を押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        //再生中か停止しているかを判断
        if (timer == nil) {
            //再生の時の処理を実行
            //UIButtonを無効化
           `return`.isEnabled = false
            proeed.isEnabled = false
            
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            }
        else {
            //UIButtonを有効化
            proeed.isEnabled = true
            `return`.isEnabled = true
            
            //停止の処理を実装
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除しておく（timer.invalidateだけだとtimerがnilにならないため）
            timer = nil
            }
        
    }
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count ) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // segueから遷移先のsubtViewControllerを取得する
   let subViewController:SubViewController = segue.destination as! SubViewController
    subViewController.selectImage = self.imageView.image
    
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


