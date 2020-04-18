/*
CREATE TABLE `users`
(
    `Id`                 int NOT NULL AUTO_INCREMENT,
    `CreateAt`           bigint       DEFAULT NULL,
    `Username`           varchar(64)  DEFAULT NULL,
    `Email`              varchar(128) DEFAULT NULL,
    `FirstName`          varchar(64)  DEFAULT NULL,
    `LastName`           varchar(64)  DEFAULT NULL,
    `Roles`              text,
);
*/

class User {
  int id;
  int createAt;
  String userName;
  String email;
  String firstName;
  String lastName;
  String roles;

  User({this.id, this.createAt, this.userName, this.email, this.firstName, this.lastName, this.roles});

  User.fromJson(Map json)
      : id = json['Id'],
        createAt = json['CreateAt'],
        userName = json['Username'],
        email = json['Email'],
        firstName = json['FirstName'],
        lastName = json['LastName'],
        roles = json['Roles'];

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreateAt": createAt,
        "Username": userName,
        "Email": email,
        "FirstName": firstName,
        "LastName": lastName,
        "Roles": roles,
      };
}
