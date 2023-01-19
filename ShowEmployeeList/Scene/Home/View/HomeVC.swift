//
//  ViewController.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var employeeTable: UITableView!
    private var localDB:EmployeeLDB!
    
    var employeeArr = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localDB = EmployeeLDB()
        self.view.backgroundColor = .white
        setupTableView()
        getAllEmplyee()
    }
   
    private func setupTableView(){
        employeeTable.delegate = self
        employeeTable.dataSource = self
        employeeTable.registerCellNib(cellClass: EmployeeCell.self)
    }
    private func getAllEmplyee(){
        
        localDB.getEmployees {[weak self] employees, error in
            guard let self else{return}
            if let employees {
                self.employeeArr.append(contentsOf: employees)
                DispatchQueue.main.async {
                    self.employeeTable.reloadData()
                }
            }
            if let error {
                self.createAlert(erroMessage: error.localizedDescription)
            }
        }
    }
    
    @IBAction func addNewEmployee(_ sender: Any) {
        self.presentInFullScreen(AddEmployeeVC.loadController(), animated: true)
    }
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.getIdentifier(), for: indexPath) as! EmployeeCell
        cell.employee = employeeArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
