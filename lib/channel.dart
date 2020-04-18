/*
CREATE TABLE `channels`
(
    `Id`            int NOT NULL AUTO_INCREMENT,
    `CreateAt`      bigint       DEFAULT NULL,
    `UpdateAt`      bigint       DEFAULT NULL,
    `Name`          varchar(64)  DEFAULT NULL,
    `Purpose`       varchar(250) DEFAULT NULL,
    `LastPostAt`    bigint       DEFAULT NULL,
    `CreatorId`     varchar(26)  DEFAULT NULL,
);
*/

class Channel {
  int id;
  int createAt;
  int updateAt;
  String name;
  String purpose;
  int lastPostAt;
  int creatorId;

  Channel({this.id, this.createAt, this.updateAt, this.name, this.purpose, this.lastPostAt, this.creatorId});

  Channel.fromJson(Map json)
      : id = json['Id'],
        createAt = json['CreateAt'],
        updateAt = json['UpdateAt'],
        name = json['Name'],
        purpose = json['Purpose'],
        lastPostAt = json['LastPostAt'],
        creatorId = json['CreatorId'];

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreateAt": createAt,
        "UpdateAt": updateAt,
        "Name": name,
        "Purpose": purpose,
        "LastPostAt": lastPostAt,
        "CreatorId": creatorId,
      };
}
