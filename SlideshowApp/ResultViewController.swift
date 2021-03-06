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
        UIImage(named: "dog1.jpeg")!,
        UIImage(named: "dog2.jpeg")!,
        UIImage(named: "dog3.jpeg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
        imageView.image = imageArray[nowIndex]
        // Do any additional setup after loading the view.
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
