//
//  EmployeeLDB.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import Foundation
import SQLite3
import SQLite

class EmployeeLDB {
    
    private let db: Connection?
    var departmentTable = Table("department")
    private let employees = Table("employees")
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let email = Expression<String>("email")
    private let hiredDate = Expression<String>("hiredDate")
  //  private let department_Id = Expression<Int64>("department_Id")
    private let departmentId = Expression<Int64>("departmentId")
    
    init() {
        
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        print("Employee: ",path)
        do {
            db = try Connection("\(path)/ShowEmployeeList.sqlite3")
            db?.foreignKeys = true
        } catch {
            db = nil
            print ("Unable to open database")
        }
        createTable()
        insertDefaultValues([
            .init(id: nil, name: "Eslam Dweeb", email: "eslamdweeb12@gmail.com", hiredDate: "15/5/2022", departmentId: 1),
            .init(id: nil, name: "Ahmed", email: "Ahmed122@gmail.com", hiredDate: "15/5/2022", departmentId: 1),
        ])
    }
    private func insertDefaultValues(_ arr:[Employee]){
        arr.forEach({
            do {
                let insert = employees.insert(name <- $0.name, email <- $0.email, hiredDate <- $0.hiredDate,departmentId <- $0.departmentId)
                let id = try db!.run(insert)
                print(insert.description)
               
            } catch let error{
                print(error.localizedDescription)
            }
        })
    }
    func createTable() {
        do {
            try db!.run(employees.create(ifNotExists: true) { table in
            table.column(id, primaryKey: .autoincrement)
            table.column(name)
            table.column(email, unique: true)
            table.column(hiredDate)
           // table.foreignKey(departmentId, references:departmentTable,departmentId)
            table.column(departmentId)
            })
        } catch {
            print("Unable to create table")
        }
    }
    func addEmployee(eName: String, eEmail: String, eHiredDate: String,eDepartmentId:Int64,completionHandeler: @escaping (_ sucess:String?,_ error:Error?)->Void) {
        do {
            let insert = employees.insert(name <- eName, email <- eEmail, hiredDate <- eHiredDate,departmentId <- eDepartmentId)
            let id = try db!.run(insert)
            print(insert.description)
            completionHandeler("Create Employee Successfully",nil)
        } catch {
           completionHandeler(nil,error)
        }
    }
    
    func getEmployees(completionHandeler: @escaping (_ employees:[Employee]?,_ error:Error?)->Void) {
        var employees = [Employee]()

        do {
            for employee in try db!.prepare(self.employees) {
                employees.append(Employee(id: employee[id], name: employee[name], email: employee[email], hiredDate: employee[hiredDate], departmentId: employee[departmentId]))
            }
        } catch {
           completionHandeler(nil,error)
        }

       completionHandeler(employees,nil)
    }
    func deleteContact(eid:Int64,completionHandeler: @escaping (_ sucess:Bool?,_ error:Error?)->Void) {
        do {
            let employee = employees.filter(id == eid)
            try db!.run(employee.delete())
           completionHandeler(true,nil)
        } catch {
            print("Delete failed")
            completionHandeler(nil,error)
        }
    }
//    func updateContact(eid:Int64, newEmployee: Employee,completionHandeler: @escaping (_ sucess:String?,_ error:Error?)->Void){
//        let employee = employees.filter(id == eid)
//        do {
//            let update = employee.update([
//                fullName <- newEmployee.fullName,
//                email <- newEmployee.email,
//                image <- newEmployee.image
//                ])
//            if try db!.run(update) > 0 {
//                completionHandeler("Update Employee Successfully",nil)
//            }
//        } catch {
//            print("Update failed: \(error)")
//            completionHandeler(nil,error)
//        }
//    }
}
