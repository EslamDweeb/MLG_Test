//
//  DepartmentLDB.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import Foundation
import SQLite3
import SQLite

class DepartmentLDB {
    
    private let db: Connection?
    
    private let departments = Table("department")
    private let departmentId = Expression<Int64>("departmentId")
    private let name = Expression<String>("name")
   
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        print("Department: ",path)
        do {
            db = try Connection("\(path)/ShowEmployeeList.sqlite3")
            db?.foreignKeys = true
        } catch {
            db = nil
            print ("Unable to open database")
        }

        createTable()
    }
     func insertDefaultValues(_ arr:[String]){
        arr.forEach({
            do {
                let insert = departments.insert(name <- $0)
                let id = try db!.run(insert)
                print(insert.description)
               
            } catch let error{
                print(error.localizedDescription)
            }
        })
    }
    func createTable() {
        do {
            try db!.run(departments.create(ifNotExists: true) { table in
            table.column(departmentId, primaryKey: .autoincrement)
            table.column(name)
            })
        } catch {
            print("Unable to create table")
        }
    }
    func addDepartment(dName: String, completionHandeler: @escaping (_ sucess:String?,_ error:Error?)->Void) {
        do {
            let insert = departments.insert(name <- dName)
            let id = try db!.run(insert)
            print(insert.description)
            completionHandeler("Create department Successfully",nil)
        } catch {
           completionHandeler(nil,error)
        }
    }
    
    func getEmployees(completionHandeler: @escaping (_ departments:[Department]?,_ error:Error?)->Void) {
        var departments = [Department]()

        do {
            for department in try db!.prepare(self.departments) {
                departments.append(.init(id: department[departmentId], name: department[name]))
            }
        } catch {
           completionHandeler(nil,error)
        }

       completionHandeler(departments,nil)
    }
    func deleteContact(eid:Int64,completionHandeler: @escaping (_ sucess:Bool?,_ error:Error?)->Void) {
        do {
            let department = departments.filter(departmentId == eid)
            try db!.run(department.delete())
           completionHandeler(true,nil)
        } catch {
            print("Delete failed")
            completionHandeler(nil,error)
        }
    }
}
