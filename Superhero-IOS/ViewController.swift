//
//  ViewController.swift
//  Superhero-IOS
//
//  Created by Mañanas on 22/5/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    
    var superheroList: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        searchSuperheroBy(name: "a")
        
    }
    
    func searchSuperheroBy(name:String){
        
        Task{
             superheroList = await SuperheroProvider.findSuperheroesByName(query: name)
            
            print(superheroList)
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        
    } 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        superheroList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuperheroViewCell", for: indexPath) as! SuperheroViewCell
            let superhero = superheroList[indexPath.row]
            cell.render(superhero: superhero)
            return cell
        }

    
    
}

