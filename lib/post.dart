/*
CREATE TABLE `posts`
(
    `Id`           int NOT NULL AUTO_INCREMENT,
    `CreateAt`     bigint       DEFAULT NULL,
    `UserId`       varchar(26)  DEFAULT NULL,
    `ChannelId`    varchar(26)  DEFAULT NULL,
    `Message`      text,
);
*/

class Post {
  int id;
  int createAt;
  int userId;
  int channelId;
  String message;

  Post({this.id, this.createAt, this.userId, this.channelId, this.message});

  Post.fromJson(Map json)
      : id = json['Id'],
        createAt = json['CreateAt'],
        userId = json['UserId'],
        channelId = json['ChannelId'],
        message = json['Message'];


  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreateAt": createAt,
        "UserId": userId,
        "ChannelId": channelId,
        "Message": message
      };
}
