//
//  EmployeeCell.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var employeeIdLbl: UILabel!
    @IBOutlet weak var employeeNameLbl: UILabel!
    @IBOutlet weak var employeeEmailLbl: UILabel!
    @IBOutlet weak var employeeHiredDateLbl: UILabel!
    @IBOutlet weak var employeeDepartmentIdLbl: UILabel!
    
   // var LocalStorage:LocalStorage?
    var employee:Employee?{
        didSet{
            guard let employee else{return}
            employeeIdLbl.text = "\(employee.id)"
            employeeNameLbl.text = employee.name
            employeeEmailLbl.text = employee.email
            employeeHiredDateLbl.text = employee.hiredDate
          employeeDepartmentIdLbl.text = "\(employee.departmentId)?? note that i cant creat forginKey"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
