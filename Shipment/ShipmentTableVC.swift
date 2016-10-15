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
    
    let selectTypes:[[SelectType]]! = [[SelectType(title:"Sowgatlary näme edeliň?", option: "Sowgatlary siz gowşuryň"), SelectType(title: "Sowgatlary näme edeliň?", option:"Meň salgyma getirip beriň")], [SelectType(title:"Tölegini nähili geçirýärsiňiz?", option: "Nagt hasaplaşyk"), SelectType(title: "Tölegini nähili geçirýärsiňiz?", option:"Online töleg (Visa, Mastercard)")]]
    
    var headerTextForSelectedType: [SelectType]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        headerTextForSelectedType.append(SelectType(title: "Nagt tölemek, sowgat ibermek", option:"Biziň kurýerimiz sowgatlar üçin tölegleri sizden alýar we sowgat ibermek isleýän adamyňyza biz sowgatlary eltip berýäris."))
        headerTextForSelectedType.append(SelectType(title: "Online tölemek, sowgat ibermek", option:"Harytlar üçin Visa, Mastercard arkaly töleg geçirýärsiňiz. Sowgatlary kime ibermek isleseňiz, şol salga eltip berýäris."))
        headerTextForSelectedType.append(SelectType(title: "Nagt tölemek, satyn almak", option:"Harytlary size gowşurýarys, harytlary alanyňyzdan soňra nagt hasaplaşyk geçýärsiňiz. Sowgatlar size eltilýär."))
        headerTextForSelectedType.append(SelectType(title: "Online tölemek, satyn almak", option:"Harytlar üçin Visa, Mastercard arkaly töleg geçirýärsiňiz. Sowgatlar size eltilýär."))
        
        //If stored value is nil then set default values and store
        //if loadStoreType(key: opt0) == nil {
            saveType(value: StoredType(tableRow: 0, collectionRow: 0), key: opt0)
        //}
        //if loadStoreType(key: opt1) == nil {
            saveType(value: StoredType(tableRow: 1, collectionRow: 0), key: opt1)
        //}

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        print(loadStoreType(key: opt0))
        print(loadStoreType(key: opt1))
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
        cell.configCell(type: self.selectTypes[indexPath.row])
        cell.tRow = indexPath.row
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90//UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let collectionViewCell = cell as? CollectionViewTableViewCell else { return }
        
        collectionViewCell.delegate = self
        
        let dataProvider = ShipmentCollectionViewDataSource()
        dataProvider.selectType = self.selectTypes[indexPath.row]
        
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
//    0 0 0 - 0
//    0 1 0 - 2
//    0 0 1 - 1
//    0 1 1 - 3
//    
//    1 0 0 - 0
//    1 1 0 - 1
//    1 0 1 - 2
//    1 1 1 - 3
    func selectedTypeForRow(tableRow: Int, collectionViewPath: IndexPath) {
        print("tableViewRow: \(tableRow) collectionViewPath: \(collectionViewPath)")
        
        if tableRow == 0 {
            let loadOpt1 = loadStoreType(key: opt1)
            if collectionViewPath.row == 0 && loadOpt1?.collectionRow == 0 {
                headerTitleLabel.text = headerTextForSelectedType[0].title
                headerDescriptionLabel.text = headerTextForSelectedType[0].option
            }
            if collectionViewPath.row == 1 && loadOpt1?.collectionRow == 0 {
                headerTitleLabel.text = headerTextForSelectedType[2].title
                headerDescriptionLabel.text = headerTextForSelectedType[2].option
            }
            if collectionViewPath.row == 0 && loadOpt1?.collectionRow == 1 {
                headerTitleLabel.text = headerTextForSelectedType[1].title
                headerDescriptionLabel.text = headerTextForSelectedType[1].option
            }
            if collectionViewPath.row == 1 && loadOpt1?.collectionRow == 1 {
                headerTitleLabel.text = headerTextForSelectedType[3].title
                headerDescriptionLabel.text = headerTextForSelectedType[3].option
            }
        }
        
        if tableRow == 1 {
            let loadOpt0 = loadStoreType(key: opt0)
            if collectionViewPath.row == 0 && loadOpt0?.collectionRow == 0 {
                headerTitleLabel.text = headerTextForSelectedType[0].title
                headerDescriptionLabel.text = headerTextForSelectedType[0].option
            }
            if collectionViewPath.row == 1 && loadOpt0?.collectionRow == 0 {
                headerTitleLabel.text = headerTextForSelectedType[1].title
                headerDescriptionLabel.text = headerTextForSelectedType[1].option
            }
            if collectionViewPath.row == 0 && loadOpt0?.collectionRow == 1 {
                headerTitleLabel.text = headerTextForSelectedType[2].title
                headerDescriptionLabel.text = headerTextForSelectedType[2].option
            }
            if collectionViewPath.row == 1 && loadOpt0?.collectionRow == 1 {
                headerTitleLabel.text = headerTextForSelectedType[3].title
                headerDescriptionLabel.text = headerTextForSelectedType[3].option
            }
        }
        tableView.layoutIfNeeded()
    }
}
