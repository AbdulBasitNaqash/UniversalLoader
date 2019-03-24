//
//  ImagesLoader.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 24/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import Foundation
import UIKit
import UniversalLoader

//Class for Loading images from the API...
class ImagesLoader{
    //Function for loading profile images...
    func loadProfileImage(imageView: UIImageView, urlString:String){
        let loader = Loader()
        loader.cacheData(urlString: urlString, onComplete: { (data) in
            imageView.image = UIImage(data: data as! Data)
            imageView.layer.cornerRadius = imageView.frame.width/2.2
            imageView.layer.masksToBounds = true
            imageView.alpha = 0.0
            UIView.animate(withDuration: 1.5, animations: { //Giving animation once the image is loaded...
                imageView.alpha = 1.0
            })
        })
    }
    //Function for loading main images...
    func loadMainImage(loader: Loader, imageView: UIImageView, urlString:String, cancelButton:UIButton){
        loader.cacheData(urlString: urlString, onComplete: { (data) in
            imageView.image = UIImage(data: data as! Data)
            imageView.alpha = 0.0
            
            UIView.animate(withDuration: 2.0, animations: {//Giving animation once the image is loaded...
                imageView.alpha = 1.0
            })
            imageView.image = UIImage(data: data as! Data)
            cancelButton.isHidden = true //Hiding the cancel button since the image is loaded...
        })
    }
}
