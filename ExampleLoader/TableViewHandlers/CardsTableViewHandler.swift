//
//  CardsTableViewHandler.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import Foundation
import UIKit
import UniversalLoader

//Class for handling the tableview datasources and delegates...
class CardsTableViewHandler: NSObject,UITableViewDelegate, UITableViewDataSource{
    var cards = [CardModel]() //To be used to hold all the cards...
    var someCards = [CardModel]() //To be used to hold the some cards for pagination purposes...
    var activityIndicator = UIActivityIndicatorView()
    let imagesLoader = ImagesLoader() //For loading the images from the API..
    var index = 0
    let END = 6
    var isScrolling = false
    
    //Function for intializing the cards array and activityIndicator...
    func intializeComponents(cards: [CardModel], activityIndicator: UIActivityIndicatorView){
        self.cards = cards
        self.activityIndicator = activityIndicator
    }
    
    //Function for adding 10 cards at time...
    func addCards(){
        for card in stride(from: index, to: index + END, by: 1) {
            someCards.append(cards[card])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return someCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell") as! CardTableViewCell
        activityIndicator.isHidden = true //Hiding the activity indicator since data is loaded...
        tableView.isHidden = false //Showing the tableview once data is loaded...
        
        
        //Assigning data to the appropriate UI elements...
        cell.userLabel.text = someCards[indexPath.row].user.name
        cell.dateLabel.text = someCards[indexPath.row].created_at.components(separatedBy: "T").first
        cell.likesLabel.text = String(someCards[indexPath.row].likes)
        
        //Calling the function for loading profile images...
        imagesLoader.loadProfileImage(imageView: cell.profileImageView, urlString: someCards[indexPath.row].user.profile_image.small)
        
        let loader = Loader() //Declaring and Initialing Loader to be used to load main images...
        loader.setLimitInBytes(limit: 20480) //Setting the maximum capacity of cache to 20 Mb...
        
        //Calling the function for loading main images...
        imagesLoader.loadMainImage(loader: loader, imageView: cell.mainImageView, urlString: someCards[indexPath.row].urls.regular, cancelButton: cell.cancelButton)
        
        //Function for handling cancel button action...
        cell.cancelAction = {
            loader.stopLoading() //Cancelling the downloading of the image...
        }
        return cell
    }
    //Function for determining if the user has scrolled down...
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = true
    }
    //Function for loading the next 10 images from the API...
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = someCards.count-1
        if isScrolling{
            //Determining if the user has reached end of the tableview...
            if indexPath.row == lastElement && someCards.count != cards.count {
                if someCards.count + END <= cards.count{
                    index += END
                    addCards()
                }
                else{
                    someCards = cards
                }
                activityIndicator.isHidden = false
                tableView.reloadData()
            }
        }
    }
}



