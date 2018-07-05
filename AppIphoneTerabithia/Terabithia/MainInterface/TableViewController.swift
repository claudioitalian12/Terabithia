//
//  TableViewController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 20/02/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit


extension MainController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(self.list.count)
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellController
    
  
        cell.buttongen.setTitle(list[indexPath.row], for: UIControlState.normal)
   
      //  tableView.separatorStyle = UITableViewCellSeparatorStyle.none
         cell.clipsToBounds = false
        cell.layer.shadowOpacity = 0.4
       
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.layer.borderWidth = 0
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.layer.borderWidth = 0
      
        if(indexPath.row % 2 == 0) {cell.isHidden = true}
        return(cell)
      
    }
    

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       
    
    
    switch (indexPath.row) {
    case 1:
        do{ performSegue(withIdentifier: "segue", sender: self)}
    default: break
        
    }
    
        
    }
}

