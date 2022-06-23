import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get hired() returns Applicant[]|error {
        // Send a response back to the caller.
        return hiredApplicants.toArray();
    }
}

type Applicant record {|
    readonly int id;
    string firstName;
    string lastName;
    string position;
    string countryCode;
    string email;
    string[] tags;
    string status;
|};

table<Applicant> key(id) hiredApplicants = table [
        {
            "id": 34344,
            "firstName": "Jane",
            "lastName": "Smith",
            "position": "QA Engineer",
            "countryCode": "USA",
            "email": "janes@email.com",
            "tags": ["Java", "Selenium", "Puppet", "AWS"],
            "status": "hired"
        },
        {
            "id": 34345,
            "firstName": "John",
            "lastName": "Henry",
            "position": "Soft Engineer",
            "countryCode": "USA",
            "email": "jj@email.com",
            "tags": ["Java", "Go Lang", "Puppet", "GCP"],
            "status": "hired"
        }

    ];
