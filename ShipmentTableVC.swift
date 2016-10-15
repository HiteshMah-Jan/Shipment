//
//  ShipmentTableVC.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import UIKit

class ShipmentTableVC: UITableViewController {
    
    var storedOffsets = [Int: CGFloat]()
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDescriptionLabel: InsetLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2 || indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as? AddressTableViewCell else {
                fatalError()
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTableViewCell", for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90//UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let collectionViewCell = cell as? CollectionViewTableViewCell else { return }
        
        collectionViewCell.delegate = self
        
        let dataProvider = ShipmentCollectionViewDataSource()
        //dataProvider.imageURLS = brands[indexPath.row].sliders
        
        let delegate = ShipmentCollectionViewDataSource()
        
        collectionViewCell.initializeCollectionViewWithDataSource(dataSource: dataProvider, delegate: delegate, forRow: indexPath.row)
        
        collectionViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let collectionViewCell = cell as? CollectionViewTableViewCell else { return }
        storedOffsets[indexPath.row] = collectionViewCell.collectionViewOffset
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShipmentTableVC: CollectionViewSelectedProtocol {
    func collectionViewSelected(collectionViewItem: Int) {
        
    }
}
