//
//  AddEmployeeVC.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import UIKit

class AddEmployeeVC: UIViewController {
    
@IBOutlet weak var employNameTxtField: BaseTextField!
    @IBOutlet weak var employEmailTxtField: BaseTextField!
    @IBOutlet weak var employDepartmentTxtField: BaseTextField!
    @IBOutlet weak var employHiredDateTxtField: BaseTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
