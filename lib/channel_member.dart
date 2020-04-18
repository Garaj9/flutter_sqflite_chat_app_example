/*
CREATE TABLE `channelmembers`
(
    `ChannelId`    varchar(26) NOT NULL,
    `UserId`       varchar(26) NOT NULL,
    `Roles`        varchar(64) DEFAULT NULL,
    `LastViewedAt` bigint      DEFAULT NULL,
    `LastUpdateAt` bigint      DEFAULT NULL,
);
*/

class ChannelMember {
  int channelId;
  int userId;
  String roles;
  int lastViewedAt;
  int lastUpdateAt;

  ChannelMember(
      {this.channelId,
      this.userId,
      this.roles,
      this.lastViewedAt,
      this.lastUpdateAt});

  ChannelMember.fromJson(Map json)
      : channelId = json['ChannelId'],
        userId = json['UserId'],
        roles = json['Roles'],
        lastViewedAt = json['LastViewedAt'],
        lastUpdateAt = json['LastUpdateAt'];

  Map<String, dynamic> toJson() => {
        "ChannelId": channelId,
        "UserId": userId,
        "Roles": roles,
        "LastViewedAt": lastViewedAt,
        "LastUpdateAt": lastUpdateAt
      };
}
