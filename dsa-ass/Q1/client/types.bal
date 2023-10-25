import ballerina/graphql;

type schema service object {
    *graphql:Service;
    resource function get getUserById(string id) returns User?;
    resource function get getUsersByRole(string role) returns User?[]?;
    resource function get getKPIById(string id) returns KPI?;
    resource function get getEmployeeKPIs(string employeeId) returns EmployeeKPI?[]?;
    resource function get getDepartmentObjectives(string employeeId) returns DepartmentObjective?[]?;
    remote function createUser(UserInput user) returns User?;
    remote function updateUser(string id, UserInput user) returns User?;
    remote function deleteUser(string id) returns User?;
    remote function createKPI(KPIInput kpi) returns KPI?;
    remote function updateKPI(string id, KPIInput kpi) returns KPI?;
    remote function deleteKPI(string id) returns KPI?;
    remote function createEmployeeKPI(EmployeeKPIInput employeeKPI) returns EmployeeKPI?;
    remote function createDepartmentObjective(DepartmentObjectiveInput departmentObjective) returns DepartmentObjective?;
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


type User record {|
        string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};

type KPI record {|
        string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};

type EmployeeKPI record {|
        string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};

type DepartmentObjective record {|
        string employeeId;
    string kpiId;
    int value;
    string gradedBy;
    int grade;
    string evalDate;
|};
