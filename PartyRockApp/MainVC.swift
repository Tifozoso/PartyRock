//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Michael Franks on 9/26/17.
//  Copyright © 2017 Popcorn Labs. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://d1marr3m5x4iac.cloudfront.net/images/edpborder500/I0-001/002/166/664-2.jpeg_/pamela-anderson-64.jpeg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ZIaxqQocq5Y\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Pam Don't Dig on Swine")
        
        let p2 = PartyRock(imageURL: "https://static1.squarespace.com/static/5285891ae4b09d15d955ce6c/t/58812ac8b8a79b4dcb017ebe/1484860108752/", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4R0bwcw1U5Q\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Pam Digs Some Other Stuff")
        
        let p3 = PartyRock(imageURL: "https://i.pinimg.com/736x/68/21/51/682151a6091210d77191b1ed0760ab5a--glitter-makeup-photo-pic.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qQmnPLHWUCs\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Pam May Like the Other White Meat")
        
        let p4 = PartyRock(imageURL: "https://static1.squarespace.com/static/5285891ae4b09d15d955ce6c/59822aa8cf81e06c98a874af/59822aaa914e6b5dc0e9d2a5/1501702828558/07.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/BZI9IkicURQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "It's a Euphemism")
        
        let p5 = PartyRock(imageURL: "https://postmediavancouversun2.files.wordpress.com/2016/06/pamela-anderson-raised-a-flute-of-the-rose-wine-that-reporte.jpeg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dme0rgUz5Fg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Probably Not Really Funny")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        
        } else {
            
            return UITableViewCell()
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let party = send as? PartyRock {
                
                destination.partyRock = party
                
            }
            
        }
    }
    
}

