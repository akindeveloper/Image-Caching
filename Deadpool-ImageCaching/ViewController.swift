//
//  ViewController.swift
//  Deadpool-ImageCaching
//
//  Created by ukgroupe on 8/30/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://i.pinimg.com/736x/66/e4/ed/66e4edd3ea18bfcac7f42cc8f5ea3ca0--desert-eagle-chimichanga.jpg")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                
                print("error")
            }else{
                if let data1 = data{
                    if let deadpoolimage = UIImage(data: data1){
                        
                        DispatchQueue.main.async(execute: {
                            self.img.image = deadpoolimage
                        })
                    }
                    
                }
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

