# UniversalLoader
A Generic data (Images, JSON, XML etc) downloading and caching library for iOS.
-Library for data downloading and caching
-Demo project including lazy loading of images
-Cancel download option
-Max capacity cache configuration option

#Usage:
let loader = Loader()
        loader.cacheData(urlString: urlString, onComplete: { (data) in
            imageView.image = UIImage(data: data as! Data)
 })
        
#Configuring Max cache capacity:
loader.setLimitInBytes(limit: 20480) 

#Cancelling download:
loader.stopLoading()
