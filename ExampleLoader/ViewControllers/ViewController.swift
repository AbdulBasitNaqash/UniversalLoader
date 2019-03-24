//
//  ViewController.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cardsTableViewHandler = CardsTableViewHandler() //Declaring and initializing this class to handle tableview delegates and datasources...
    var refreshControl = UIRefreshControl() //For pull to refresh
    
    @IBOutlet weak var progressActivityIndicator: UIActivityIndicatorView! // To indicate the loading of data for tableview...
    
    @IBOutlet weak var tableView: UITableView! //The main tableview for displaying contents...
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.delegate = cardsTableViewHandler // Assigning the class as delegate for tableview...
        tableView.dataSource = cardsTableViewHandler// Assigning the class as datasource for tableview...
        tableView.isHidden = true //Keeping tableview hidden till the data loads...
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl) //Adding the pull to refresh control to tableview...
        
        fetchJSONData()// Calling the function for fetching JSON data from the API and loading the tableview...
        
    }
    
    //Function for fetching JSON data from the API and loading the tableview...
    func fetchJSONData(){
        let jsonFetcher = JSONFetcher()
        //Calling this function to get the json data from the API in the form of array of CardModel as cards...
        jsonFetcher.fetchJSONData(urlString: urlString) { [weak self](success, cards) in
            
            if success{
                //Function for intializing the CardModel array and activityIndicator for the CardsTableview handler class...
                self?.cardsTableViewHandler.intializeComponents(cards: cards,activityIndicator: (self?.progressActivityIndicator)!)
                //Function for adding first 10 cards to someCards array for the first time...
                self?.cardsTableViewHandler.addCards()
                self?.tableView.reloadData()//Loading the tableview on the data is fetched...
                self?.refreshControl.endRefreshing()// hiding the pull to refresh control...
            }
            else{
                let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
                alert.present(self!, animated: true, completion: nil)
            }
        }
    }
    
    //Function for calling the API again for new data and refreshing the tableview...
    @objc func refresh(sender:AnyObject) {
        fetchJSONData() // Calling the function for fetching JSON data from the API and loading the tableview...
    }
}

