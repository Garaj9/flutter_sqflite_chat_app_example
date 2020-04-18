import 'package:flutter/material.dart';
import 'package:sql_lite/sql_lite_manager.dart';

import 'channel.dart';
import 'channel_member.dart';
import 'post.dart';
import 'user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [
    User(
        id: 1,
        createAt: 1234234,
        email: 'yasintuncel@gmail.com',
        userName: 'yasintuncel',
        firstName: 'yasin',
        lastName: 'tuncel',
        roles: 'BiGBoss'),
    User(
        id: 2,
        createAt: 34234234,
        email: ',bedireray@gmail.com',
        userName: 'bedireray',
        firstName: 'bedir',
        lastName: 'eray',
        roles: 'BiGBoss2'),
    User(
        id: 3,
        createAt: 345345,
        email: 'mahmut@gmail.com',
        userName: 'mahmutLolcu',
        firstName: 'mahmut',
        lastName: 'ozovacik',
        roles: 'LoLcu'),
  ];

  List<Channel> channels = [
    Channel(
        id: 1,
        createAt: 1234234,
        updateAt: 2432343,
        name: 'grup1',
        purpose: 'denemegrubu',
        lastPostAt: 12312323,
        creatorId: 1),
    Channel(
        id: 2,
        createAt: 1234234,
        updateAt: 2432343,
        name: 'grup2',
        purpose: 'denemegrubu',
        lastPostAt: 12312323,
        creatorId: 2),
  ];

  List<ChannelMember> channelMembers = [
    ChannelMember(
        channelId: 1,
        userId: 1,
        roles: "BiggyBossy",
        lastViewedAt: 13231242,
        lastUpdateAt: 12312312),
    ChannelMember(
        channelId: 1,
        userId: 2,
        roles: "PatroNossy",
        lastViewedAt: 21312323,
        lastUpdateAt: 34452323),
  ];

  List<Post> posts = [
    Post(
      id: 123,
      createAt: 21323,
      userId: 1,
      channelId: 1,
      message: "hellomoto"
    ),
    Post(
      id: 233,
      createAt: 1253241,
      userId: 2,
      channelId: 2,
      message: "hellomoto2"
    ),
    Post(
      id: 125,
      createAt: 566565,
      userId: 3,
      channelId: 1,
      message: "hellomoto3"
    )
  ];

  handleSQL() async {
    await sqlManager.createDatabase();

    // users
    // await sqlManager.dropUsersTable();
    // await sqlManager.createUsersTable();

    // users.forEach((user) async {
    //   await sqlManager.insertUser(user);
    // });

    // await sqlManager.updateUser(User(
    //     id: 3,
    //     createAt: 345345,
    //     email: 'mahmut@gmail.com',
    //     userName: 'mahmut Lolcu',
    //     firstName: 'mahmut',
    //     lastName: 'ozovacik',
    //     roles: 'the.LOL.KING'));

    usersText = '';
    List<User> newUsers = await sqlManager.getUsers();
    newUsers.forEach((user) {
      usersText = '$usersText${user.userName}\n';
    });

    // channels
    // await sqlManager.dropChannelsTable();
    // await sqlManager.createChannelsTable();

    // channels.forEach((channel) async {
    //   await sqlManager.insertChannel(channel);
    // });

    channelsText = '';
    List<Channel> newChannels = await sqlManager.getChannels();
    newChannels.forEach((channel) {
      channelsText =
          '$channelsText${channel.name} created by ${channel.creatorId}\n';
    });

    // channel members
    // await sqlManager.dropChannelMembersTable();
    // await sqlManager.createChannelMembersTable();

    // channelMembers.forEach((channelMember) async {
    //   await sqlManager.insertChannelMembers(channelMember);
    // });

    // await sqlManager.updateChannelMember(
    //   ChannelMember(
    //       channelId: 1,
    //       userId: 2,
    //       roles: "PatroNossy yeni",
    //       lastViewedAt: 21312323,
    //       lastUpdateAt: 34452323),
    // );

    channelMemberText = '';
    List<ChannelMember> newChannelMember = await sqlManager.getChannelMembers();
    newChannelMember.forEach((channelMember) {
      channelMemberText =
          '$channelMemberText${channelMember.userId} - ${channelMember.roles}\n';
    });

    // posts
    // await sqlManager.dropPostTable();
    // await sqlManager.createPostTable();

    // posts.forEach((post) async {
    //   await sqlManager.insertPost(post);
    // });

    // await sqlManager.updateChannelMember(
    //   ChannelMember(
    //       channelId: 1,
    //       userId: 2,
    //       roles: "PatroNossy yeni",
    //       lastViewedAt: 21312323,
    //       lastUpdateAt: 34452323),
    // );

    postText = '';
    List<Post> newPosts = await sqlManager.getPosts();
    newPosts.forEach((post) {
      postText =
          '$postText${post.userId} - ${post.message}\n';
    });



    await sqlManager.closeDatabase();
    setState(() {});
  }

  String usersText = 'users here';
  String channelsText = 'channels here';
  String channelMemberText = 'channel members here';
  String postText = 'posts here';

  @override
  void initState() {
    handleSQL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              usersText,
            ),
            Text(
              channelsText,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              channelMemberText,
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              postText,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
