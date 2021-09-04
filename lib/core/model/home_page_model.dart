import 'package:convre/app/constants/images.dart';

class HomePageModel {
  final String profileimage;
  final String name;
  final String subName;
  final String time;
  final String title;
  final String context;
  final String contextImage;
  final int messages;
  final int likes;

  HomePageModel({
    this.profileimage,
    this.name,
    this.subName,
    this.time,
    this.title,
    this.context,
    this.messages,
    this.likes,
    this.contextImage,
  });
}

List<HomePageModel> homePageModel = [
  HomePageModel(
      name: 'Crypto_dina_africa',
      subName: 'crypto_dina_africa',
      time: '2021-09-03 14:27:40',
      title:
          'Bitcoin miners post #1.4 billion in revenue for August data shows',
      context:
          'Bitcoin miners brought in opportunity #1.41 billion in revenue during the month of August, according to data compiled by The block Research. The monthly figure is shown below.',
      likes: 2,
      messages: 5,
      profileimage: Images.profile1,
      contextImage: Images.context2),

        HomePageModel(
      name: 'Zoo',
      subName: 'jim',
      time: '2021-07-02 14:30:40',
      title:
          'Bitcoin miners post #1.4 billion in revenue for August data shows',
      context:
          'Bitcoin miners brought in opportunity #1.41 billion in revenue during the month of August, according to data compiled by The block Research. The monthly figure is shown below.',
      likes: 2,
      messages: 5,
      profileimage: Images.profile2,
      contextImage: Images.context1),

        HomePageModel(
      name: 'Kolex',
      subName: 'tola',
      time: '2021-09-04 15:00:40',
      title:
          'Bitcoin miners post #1.4 billion in revenue for August data shows',
      context:
          'Bitcoin miners brought in opportunity #1.41 billion in revenue during the month of August, according to data compiled by The block Research. The monthly figure is shown below.',
      likes: 2,
      messages: 5,
      profileimage: Images.profile1,
      contextImage: Images.context2)
];
