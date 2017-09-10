//
//  ChatViewController.swift
//  70_AlexChat
//
//  Created by Alex Koh on 10/09/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        //Enable the autosize of tableCell
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //remove the separator line of the table view
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTableViewCell else {return UITableViewCell()}
        
//        cell.senderLabel.text = "Hi hello!ajflajglkjalfjlkajfljfljlkjaljflajflajldfjalkjflsajdlkfjalsdjflasjdlfjalfjalsdjflajfljaslfjlflajlajflajlkfjalfjaljfljflaj"
        
        cell.receiverLabel.text = "afjalfjlajflajlfajljflasjflajlkdjflajlkjlfjalldjlajlfjalfjlajlkajlajlajlfajjalkjflajlkajlkjalfjlkajlajlkajljfalfjlajlkajf"
        cell.senderLabel.backgroundColor = UIColor.white
        
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


















