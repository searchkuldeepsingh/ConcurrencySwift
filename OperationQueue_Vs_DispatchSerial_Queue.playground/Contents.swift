import UIKit

struct Employee {
    func syncOfflineEmployeeRecords() {
        debugPrint("Syncing offline records for employee started")
        Thread.sleep(forTimeInterval: 2)
        debugPrint("Syncing completed for employee")
    }
}

struct Department {
    func syncOfflineDepartmentRecords() {

        debugPrint("Syncing offline records for department started")
        Thread.sleep(forTimeInterval: 2)
        debugPrint("Syncing completed for department")
    }
}

struct SyncManager {
    func syncOfflineRecords() {

        let employeeSyncOperation = BlockOperation()
        employeeSyncOperation.addExecutionBlock {
            let employee = Employee()
            employee.syncOfflineEmployeeRecords()
        }

        let departmentSyncOperation = BlockOperation()
        departmentSyncOperation.addExecutionBlock {
            let department = Department()
            department.syncOfflineDepartmentRecords()
        }

        employeeSyncOperation.addDependency(departmentSyncOperation)

        let operationQueue = OperationQueue()
        operationQueue.addOperation(employeeSyncOperation)
        operationQueue.addOperation(departmentSyncOperation)
    }
}

let obj = SyncManager()
obj.syncOfflineRecords()

