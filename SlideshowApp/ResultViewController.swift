//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 増田 一樹 on 2020/12/15.
//  Copyright © 2020 Kazuki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex : Int = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "dog1")!,
        UIImage(named: "dog2")!,
        UIImage(named: "dog3")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
        imageView.image = imageArray[nowIndex]
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のViewControllerを取得する
        let ViewController:ViewController = segue.destination as! ViewController
        ViewController.nowIndex = self.nowIndex
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
