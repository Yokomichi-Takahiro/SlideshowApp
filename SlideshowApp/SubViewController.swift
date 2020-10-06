//
//  SubViewController.swift
//  SlideshowApp
//
//  Created by 横道貴浩 on 2020/10/05.
//  Copyright © 2020 横道貴浩. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var selectImage: UIImage!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = selectImage
        
        
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
