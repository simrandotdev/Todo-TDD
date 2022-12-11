//
//  ToDoItemsListViewController.swift
//  Todo-TDD
//
//  Created by Simran Preet Narang on 2022-12-09.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todoItemStore: ToDoItemStoreProtocol?
    private var items: [TodoItem] = []
    private var token: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        token = todoItemStore?.itemPublisher
            .sink(receiveValue: { [weak self] items in
                self?.items = items
                print("✅", items)
            })
        
        
    }
}


extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
