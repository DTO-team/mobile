class NewFeed {
  String id;
  String userFirstName;
  String team;
  String userProfilePic;
  String tweet;
  List<String> imageLinks;
  String tweetedAt;
  String topic;

  NewFeed({
    required this.id,
    required this.userFirstName,
    required this.team,
    required this.userProfilePic,
    required this.tweet,
    required this.imageLinks,
    required this.tweetedAt,
    required this.topic
  });
}
