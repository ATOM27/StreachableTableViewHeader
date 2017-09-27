//
//  MainTableViewController.swift
//  StreachableTableViewHeader
//
//  Created by Eugene Mekhedov on 27.09.17.
//  Copyright © 2017 Eugene Mekhedov. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let imageView = UIImageView()
    @IBOutlet var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 50
        tableView.backgroundColor = .darkGray
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
        imageView.image = UIImage(named: "country-road-wallpaper-3")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDelegate and DataSource
    
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        switch indexPath.row % 2 {
        case 0:
            cell.titleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus fermentum enim, ut euismod libero consequat a."
            cell.contentView.backgroundColor = .darkGray
        default:
            cell.titleLabel.text = "Cras sed dolor dolor. In hac habitasse platea dictumst  ."
            cell.contentView.backgroundColor = .black
            cell.titleLabel.textColor = .white
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = 300 - (scrollView.contentOffset.y + 300)
        
        let height = min(max(y, 60), y)
            
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: height)
    }
}
