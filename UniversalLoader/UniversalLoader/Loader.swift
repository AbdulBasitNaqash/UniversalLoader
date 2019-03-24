//
//  Loader.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//
//Class created for downloading the data if not cached already and save it in cache..
import Foundation

open class Loader{
    static let dataCache = NSCache<AnyObject, AnyObject>()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    
    public init(){}
    
   open func cacheData(urlString: String, onComplete: @escaping (AnyObject)->Void){
        let url = URL(string: urlString)
        
        //Determining if the data is already cached...
        if let dataFromCache = Loader.dataCache.object(forKey: urlString as AnyObject) {
            onComplete(dataFromCache)
        }
        //If data not cached...
        if let url = url{
            urlSession.dataTask(with: url) {
                data, response, error in
                if data != nil {
                    DispatchQueue.main.async {
                        Loader.dataCache.setObject(data! as AnyObject, forKey: urlString as AnyObject)
                        onComplete(data! as AnyObject)//Returning data once downloaded...
                    }
                }
                }.resume()
        }
    }
    
    //Function for stopping the download task...
    open func stopLoading(){
        self.urlSession.invalidateAndCancel()
    }
    //Function for setting the limit for cache size...
    open func setLimitInBytes(limit: Int){
        Loader.dataCache.totalCostLimit = limit
    }
    
}
