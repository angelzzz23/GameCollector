//
//  ViewController.swift
//  GameCollector
//
//  Created by Victor Zambrano on 2/17/17.
//  Copyright © 2017 Angelzzz23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var games : [Game] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
        do
        {
           games = try context.fetch(Game.fetchRequest())
           tableView.reloadData()
        }
        catch
        {
            
        }
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell()
        let game = games[indexPath.row]
        cell.textLabel?.text = game.title
        cell.imageView?.image = UIImage(data: game.image as! Data)
        return cell
    }
    
}
