import 'dart:convert';

class CreateRequest {
  // Get Device OS
  //String os = Platform.operatingSystem;


  Future<dynamic> userSearch(
      {String userId = '',}) async {


    String request = json.encode({
      'id':userId
    });


    var map = new Map<String, dynamic>();
    map['id'] = userId;



    return map;
  }


  Future<dynamic> addUser({
    String name = '',
    String dob = '',
    String guardianName = '',
    String department = '',
    String role = '',
    String gender = '',
    String maritalStatus = '',
    String permanentAddress = '',
    String currentLocatedAddress = '',
    String contactNumber = '',
  }) async {
    String request = json.encode({
      "name": name,
      "name": dob,
      "name": guardianName,
      "name": department,
      "name": role,
      "query": gender,
      "query": maritalStatus,
      "query": permanentAddress,
      "query": currentLocatedAddress,
      "query": contactNumber,
    });



    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['dob'] = dob;
    map['guardianName'] = guardianName;
    map['department'] = department;
    map['role'] = role;
    map['gender'] = gender;
    map['maritalStatus'] = maritalStatus;
    map['permanentAddress'] = permanentAddress;
    map['currentLocatedAddress'] = currentLocatedAddress;
    map['contactNumber'] = contactNumber;



    return map;
  }



  Future<dynamic> deleteUser(
      {String userId = '',}) async {


    var map = new Map<String, dynamic>();
    map['id'] = userId;


    return map;
  }




  Future<dynamic> allUser({String email = ''}) async {
    String request = json.encode({
    });

    var map = new Map<String, dynamic>();
    return map;
  }






}
