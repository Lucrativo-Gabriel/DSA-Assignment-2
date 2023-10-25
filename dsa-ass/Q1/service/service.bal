import ballerina/io;
import ballerina/sql;
import ballerinax/mongodb;
import ballerinax/mongodb.driver as mongo;

service schema on new mongodb:Listener(9090) {
    private string dbName = "DSA";
    private string userCollection = "User";
    private string kpiCollection = "KPI";
    private string employeeKPICollection = "EmployeeKPI";
    private string departmentObjectiveCollection = "DepartmentObjective";

    private readonly mongo:Client mongoClient = check new (dbName, "mongodb://localhost:27017", "anna", "");

    remote function getUserById(string id) returns User? {
        io:println("Get User Touched !");
        io:println(id);

        User|error result = check getUserFromDB(id, userCollection);
        if (result is User) {
            return result;
        } else {
            return ();
        }
    }

    remote function getUsersByRole(string role) returns User?[]? {
        User[]|error result = check getUsersFromDB(role, userCollection);
        if (result is User[]) {
            return result;
        } else {
            return ();
        }
    }

    remote function getKPIById(string id) returns KPI? {
        KPI|error result = check getKPIFromDB(id, kpiCollection);
        if (result is KPI) {
            return result;
        } else {
            return ();
        }
    }

    remote function getEmployeeKPIs(string employeeId) returns EmployeeKPI?[]? {
        EmployeeKPI[]|error result = check getEmployeeKPIsFromDB(employeeId, employeeKPICollection);
        if (result is EmployeeKPI[]) {
            return result;
        } else {
            return ();
        }
    }

    remote function getDepartmentObjectives(string employeeId) returns DepartmentObjective?[]? {
        io:println("Get Department Objectives Touched !");
        DepartmentObjective[]|error result = check getDepartmentObjectivesFromDB(employeeId, departmentObjectiveCollection);
        if (result is DepartmentObjective[]) {
            return result;
        } else {
            return ();
        }
    }

    remote function createUser(UserInput user) returns User? {
        io:println("Create User Touched !");
        User|error result = check insertUserIntoDB(user, userCollection);
        if (result is User) {
            return result;
        } else {
            return ();
        }
    }

    remote function updateUser(string id, UserInput user) returns User? {
        io:println("Update User Touched !");
        User|error result = check updateUserInDB(id, user, userCollection);
        if (result is User) {
            return result;
        } else {
            return ();
        }
    }

    remote function deleteUser(string id) returns User? {
        io:println("Delete User Touched !");
        User|error result = check deleteUserFromDB(id, userCollection);
        if (result is User) {
            return result;
        } else {
            return ();
        }
    }

    remote function createKPI(KPIInput kpi) returns KPI? {
        io:println("createKPI User Touched !");
        KPI|error result = check insertKPIIntoDB(kpi, kpiCollection);
        if (result is KPI) {
            return result;
        } else {
            return ();
        }
    }

    remote function updateKPI(string id, KPIInput kpi) returns KPI? {
        io:println("Delete User Touched !");
        KPI|error result = check updateKPIInDB(id, kpi, kpiCollection);
        if (result is KPI) {
            return result;
        } else {
            return ();
        }
    }

    remote function deleteKPI(string id) returns KPI? {
        io:println("Delete User Touched !");
        KPI|error result = check deleteKPIFromDB(id, kpiCollection);
        if (result is KPI) {
            return result;
        } else {
            return ();
        }
    }

    remote function createEmployeeKPI(EmployeeKPIInput employeeKPI) returns EmployeeKPI? {
        io:println("Delete User Touched !");
        EmployeeKPI|error result = check insertEmployeeKPIIntoDB(employeeKPI, employeeKPICollection);
        if (result is EmployeeKPI) {
            return result;
        } else {
            return ();
        }
    }

    remote function createDepartmentObjective(DepartmentObjectiveInput departmentObjective) returns DepartmentObjective? {
        io:println("Delete User Touched !");
        DepartmentObjective|error result = check insertDepartmentObjectiveIntoDB(departmentObjective, departmentObjectiveCollection);
        if (result is DepartmentObjective) {
            return result;
        } else {
            return ();
        }
    }

    private function getUserFromDB(string id, string collection) returns User|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        User? result = check self.mongoClient->findOne(collection, { "_id": docId });
        return result;
    }

    private function getUsersFromDB(string role, string collection) returns User[]|error {
        User[]? result = check self.mongoClient->find(collection, { "role": role });
        return result;
    }

    private function getKPIFromDB(string id, string collection) returns KPI|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        KPI? result = check self.mongoClient->findOne(collection, { "_id": docId });
        return result;
    }

    private function getEmployeeKPIsFromDB(string employeeId, string collection) returns EmployeeKPI[]|error {
        EmployeeKPI[]? result = check self.mongoClient->find(collection, { "employeeId": employeeId });
        return result;
    }

    private function getDepartmentObjectivesFromDB(string employeeId, string collection) returns DepartmentObjective[]|error {
        DepartmentObjective[]? result = check self.mongoClient->find(collection, { "employeeId": employeeId });
        return result;
    }

    private function insertUserIntoDB(UserInput user, string collection) returns User|error {
        User newUser = check <User>user;
        newUser._id = check <mongo:DocumentId>uuid();
        check self.mongoClient->insert(collection, newUser);
        return newUser;
    }

    private function updateUserInDB(string id, UserInput user, string collection) returns User|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        User updatedUser = check <User>user;
        updatedUser._id = docId;
        check self.mongoClient->replace(collection, { "_id": docId }, updatedUser);
        return updatedUser;
    }

    private function deleteUserFromDB(string id, string collection) returns User|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        User? deletedUser = check self.mongoClient->remove(collection, { "_id": docId });
        return deletedUser;
    }

    private function insertKPIIntoDB(KPIInput kpi, string collection) returns KPI|error {
        KPI newKPI = check <KPI>kpi;
        newKPI._id = check <mongo:DocumentId>uuid();
        check self.mongoClient->insert(collection, newKPI);
        return newKPI;
    }

    private function updateKPIInDB(string id, KPIInput kpi, string collection) returns KPI|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        KPI updatedKPI = check <KPI>kpi;
        updatedKPI._id = docId;
        check self.mongoClient->replace(collection, { "_id": docId }, updatedKPI);
        return updatedKPI;
    }

    private function deleteKPIFromDB(string id, string collection) returns KPI|error {
        mongo:DocumentId docId = check <mongo:DocumentId>id;
        KPI? deletedKPI = check self.mongoClient->remove(collection, { "_id": docId });
        return deletedKPI;
    }

    private function insertEmployeeKPIIntoDB(EmployeeKPIInput employeeKPI, string collection) returns EmployeeKPI|error {
        EmployeeKPI newEmployeeKPI = check <EmployeeKPI>employeeKPI;
        newEmployeeKPI._id = check <mongo:DocumentId>uuid();
        check self.mongoClient->insert(collection, newEmployeeKPI);
        return newEmployeeKPI;
    }

    private function insertDepartmentObjectiveIntoDB(DepartmentObjectiveInput departmentObjective, string collection) returns DepartmentObjective|error {
        DepartmentObjective newDepartmentObjective = check <DepartmentObjective>departmentObjective;
        newDepartmentObjective._id = check <mongo:DocumentId>uuid();
        check self.mongoClient->insert(collection, newDepartmentObjective);
        return newDepartmentObjective;
    }
};

public type DepartmentObjectiveInput record {|
    string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};

public type EmployeeKPIInput record {|
    string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};

public type GradeInput record {|
    string employeeId;
    int grade;
|};

public type KPIInput record {|
    string name;
    string objective;
    string unit;
    float weightage;
    string createdBy;
    string createdAt;
|};

public type UserInput record {|
    string username;
    string password;
    string role;
    string department;
    string position;
    string email;
    string? assignedSupervisor;
    string? assignedHoD;
    string?[]? assignedEmployees;
    string?[]? objectives;
    GradeInput?[]? grades;
    string?[]? KPIs;
|};

public distinct service class DepartmentObjective {
    resource function get employeeId() returns string {
        return "Test String";
    }

    resource function get kpiId() returns string {
        return "Test String";
    }

    resource function get value() returns int {
        return 0;
    }

    resource function get gradedBy() returns string {
        return "Test String";
    }

    resource function get grade() returns int {
        return 0;
    }

    resource function get evalDate() returns string {
        return "Test String";
    }
}

public distinct service class EmployeeKPI {
    resource function get employeeId() returns string {
        return "Test String";
    }

    resource function get kpiId() returns string {
        return "Test String";
    }

    resource function get value() returns int {
        return 0;
    }

    resource function get gradedBy() returns string {
        return "Test String";
    }

    resource function get grade() returns int {
        return 0;
    }

    resource function get evalDate() returns string {
        return "Test String";
    }
}

public distinct service class Grade {
    resource function get employeeId() returns string {
        return "Test String";
    }

    resource function get grade() returns int {
        return 0;
    }
}

public distinct service class KPI {
    resource function get _id() returns string {
        return "Test String";
    }

    resource function get name() returns string {
        return "Test String";
    }

    resource function get objective() returns string {
        return "Test String";
    }

    resource function get unit() returns string {
        return "Test String";
    }

    resource function get weightage() returns float {
        return 0;
    }

    resource function get createdBy() returns string {
        return "Test String";
    }

    resource function get createdAt() returns string {
        return "Test String";
    }
}

public distinct service class User {
    resource function get _id() returns string {
        return "Test String";
    }

    resource function get username() returns string {
        return "Test String";
    }

    resource function get password() returns string {
        return "Test String";
    }

    resource function get role() returns string {
        return "Test String";
    }

    resource function get department() returns string {
        return "Test String";
    }

    resource function get position() returns string {
        return "Test String";
    }

    resource function get email() returns string {
        return "Test String";
    }

    resource function get assignedSupervisor() returns string? {
        return "";
    }

    resource function get assignedHoD() returns string? {
        return "";
    }

    resource function get assignedEmployees() returns string?[]? {
        return [];
    }

    resource function get objectives() returns string?[]? {
        return [];
    }

    resource function get grades() returns Grade?[]? {
        return [];
    }

    resource function get KPIs() returns string?[]? {
        return [];
    }
}
