import ballerina/io;
import ballerina/graphql;

public type UserResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type UsersByRoleResponse record {
    record {|
        string username;
        string role;
        string department;
        string position;
        string email;
    |} data;
};

public type KPIResponse record {
    record {|
        string name;
        string objective;
        string unit;
        float weightage;
        string createdBy;
        string createdAt;
    |} data;
};

public type EmployeeKPIsResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type DepartmentObjectivesResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type CreateUserResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type UpdateUserResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type DeleteUserResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type CreateKPIResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type UpdateKPIResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type DeleteKPIResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type CreateEmployeeKPIResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public type CreateDepartmentObjectiveResponse record {
    record {|
        string employeeId;
        string kpiId;
        int value;
        string gradedBy;
        int grade;
        string evalDate;
    |} data;
};

public function main() returns error? {
    graphql:Client graphqlClient = check new ("localhost:9090/graphql");

    // Query to get user by ID
    string getUserByIdQuery = "query { getUserById(id: \"1001\") {employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Query to get users by role
    string getUsersByRoleQuery = "query { getUsersByRole(role: \"yourRole\") {username, role, department, position, email} }";

    // Query to get KPI by ID
    string getKPIByIdQuery = "query { getKPIById(id: \"1\") {name, objective, unit, weightage, createdBy, createdAt} }";

    // Query to get employee KPIs
    string getEmployeeKPIsQuery = "query { getEmployeeKPIs(employeeId: \"1\") {employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Query to get department objectives
    string getDepartmentObjectivesQuery = "query { getDepartmentObjectives(employeeId: \"1\") {employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to create a user
    string createUserMutation = "mutation { createUser(user: { username: \"yourUsername\", password: \"yourPassword\", role: \"yourRole\", department: \"yourDepartment\", position: \"yourPosition\", email: \"yourEmail\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to update a user
    string updateUserMutation = "mutation { updateUser(id: \"1\", user: { username: \"yourUsername\", password: \"yourPassword\", role: \"yourRole\", department: \"yourDepartment\", position: \"yourPosition\", email: \"yourEmail\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to delete a user
    string deleteUserMutation = "mutation { deleteUser(id: \"1\") { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to create a KPI
    string createKPIMutation = "mutation { createKPI(kpi: { name: \"yourKPIName\", objective: \"yourObjective\", unit: \"yourUnit\", createdBy: \"yourCreatedBy\", createdAt: \"yourCreatedAt\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to update a KPI
    string updateKPIMutation = "mutation { updateKPI(id: \"1\", kpi: { name: \"yourKPIName\", objective: \"yourObjective\", unit: \"yourUnit\", createdBy: \"yourCreatedBy", createdAt: \"yourCreatedAt\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to delete a KPI
    string deleteKPIMutation = "mutation { deleteKPI(id: \"1\") { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to create an employee KPI
    string createEmployeeKPIMutation = "mutation { createEmployeeKPI(employeeKPI: { employeeId: \"yourEmployeeId\", kpiId: \"yourKPIId\", value: 42, gradedBy: \"yourGrader\", grade: 5, evalDate: \"yourEvalDate\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Mutation to create a department objective
    string createDepartmentObjectiveMutation = "mutation { createDepartmentObjective(departmentObjective: { employeeId: \"yourEmployeeId\", kpiId: \"yourKPIId\", value: 42, gradedBy: \"yourGrader\", grade: 5, evalDate: \"yourEvalDate\" }) { employeeId, kpiId, value, gradedBy, grade, evalDate } }";

    // Execute queries and mutations
    UserResponse userByIdResponse = check graphqlClient->execute(getUserByIdQuery);
    handleResponse_handleResponse_UserResponse(userByIdResponse);

    UsersByRoleResponse usersByRoleResponse = check graphqlClient->execute(getUsersByRoleQuery);
    handleResponse_handleResponse_UsersByRoleResponse(usersByRoleResponse);

    KPIResponse kpiByIdResponse = check graphqlClient->execute(getKPIByIdQuery);
    handleResponse_handleResponse_KPIResponse(kpiByIdResponse);

    EmployeeKPIsResponse employeeKPIsResponse = check graphqlClient->execute(getEmployeeKPIsQuery);
    handleResponse_handleResponse_EmployeeKPIsResponse(employeeKPIsResponse);

    DepartmentObjectivesResponse departmentObjectivesResponse = check graphqlClient->execute(getDepartmentObjectivesQuery);
    handleResponse_handleResponse_DepartmentObjectivesResponse(departmentObjectivesResponse);

    CreateUserResponse createUserResponse = check graphqlClient->execute(createUserMutation);
    handleResponse_handleResponse_CreateUserResponse(createUserResponse);

    UpdateUserResponse updateUserResponse = check graphqlClient->execute(updateUserMutation);
    handleResponse_handleResponse_UpdateUserResponse(updateUserResponse);

    DeleteUserResponse deleteUserResponse = check graphqlClient->execute(deleteUserMutation);
    handleResponse_handleResponse_DeleteUserResponse(deleteUserResponse);

    CreateKPIResponse createKPIResponse = check graphqlClient->execute(createKPIMutation);
    handleResponse_handleResponse_CreateKPIResponse(createKPIResponse);

    UpdateKPIResponse updateKPIResponse = check graphqlClient->execute(updateKPIMutation);
    handleResponse_handleResponse_UpdateKPIResponse(updateKPIResponse);

    DeleteKPIResponse deleteKPIResponse = check graphqlClient->execute(deleteKPIMutation);
    handleResponse_handleResponse_DeleteKPIResponse(deleteKPIResponse);

    CreateEmployeeKPIResponse createEmployeeKPIResponse = check graphqlClient->execute(createEmployeeKPIMutation);
    handleResponse_handleResponse_CreateEmployeeKPIResponse(createEmployeeKPIResponse);

    CreateDepartmentObjectiveResponse createDepartmentObjectiveResponse = check graphqlClient->execute(createDepartmentObjectiveMutation);
    handleResponse_handleResponse_CreateDepartmentObjectiveResponse(createDepartmentObjectiveResponse);

    io:println("Complete !");
}

function handleResponse_UserResponse(UserResponse response) {
    match response {
        UserResponse userResp => {
            io:println("Data: ", userResp.data.profile);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_UsersByRoleResponse(UsersByRoleResponse response) {
    match response {
        UsersByRoleResponse usersByRoleResp => {
            io:println("Data: ", usersByRoleResp.data.field1);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_KPIResponse(KPIResponse response) {
    match response {
        KPIResponse kpiResp => {
            io:println("Data: ", kpiResp.data.name);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_EmployeeKPIsResponse(EmployeeKPIsResponse response) {
    match response {
        EmployeeKPIsResponse employeeKPIsResp => {
            io:println("Data: ", employeeKPIsResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_DepartmentObjectivesResponse(DepartmentObjectivesResponse response) {
    match response {
        DepartmentObjectivesResponse departmentObjectivesResp => {
            io:println("Data: ", departmentObjectivesResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_CreateUserResponse(CreateUserResponse response) {
    match response {
        CreateUserResponse createUserResp => {
            io:println("Data: ", createUserResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_UpdateUserResponse(UpdateUserResponse response) {
    match response {
        UpdateUserResponse updateUserResp => {
            io:println("Data: ", updateUserResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_DeleteUserResponse(DeleteUserResponse response) {
    match response {
        DeleteUserResponse deleteUserResp => {
            io:println("Data: ", deleteUserResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_CreateKPIResponse(CreateKPIResponse response) {
    match response {
        CreateKPIResponse createKPIResp => {
            io:println("Data: ", createKPIResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_UpdateKPIResponse(UpdateKPIResponse response) {
    match response {
        UpdateKPIResponse updateKPIResp => {
            io:println("Data: ", updateKPIResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_DeleteKPIResponse(DeleteKPIResponse response) {
    match response {
        DeleteKPIResponse deleteKPIResp => {
            io:println("Data: ", deleteKPIResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_CreateEmployeeKPIResponse(CreateEmployeeKPIResponse response) {
    match response {
        CreateEmployeeKPIResponse createEmployeeKPIResp => {
            io:println("Data: ", createEmployeeKPIResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}

function handleResponse_CreateDepartmentObjectiveResponse(CreateDepartmentObjectiveResponse response) {
    match response {
        CreateDepartmentObjectiveResponse createDepartmentObjectiveResp => {
            io:println("Data: ", createDepartmentObjectiveResp.data.employeeId);
        }
        error err => {
            io:println("Error: ", err);
        }
    }
}
