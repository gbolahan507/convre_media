import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convre/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeViewHeading extends StatefulWidget {
  final String profileImage;
  final String profileName;
  final String subName;
  final String time;

  HomeViewHeading(
      {this.profileImage, this.profileName, this.subName, this.time});

  @override
  _HomeViewHeadingState createState() => _HomeViewHeadingState();
}

class _HomeViewHeadingState extends State<HomeViewHeading> {
  final spinkit = SpinKitCircle(
    color: AppColors.red,
    size: 30.0,
  );

  final doublbBounce = SpinKitDoubleBounce(
    color: AppColors.red,
    size: 30.0,
  );

  

  Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(minutes: 1), (timer) {
      print(DateTime.now());
      setState(() {});
    });
    super.initState();
  }

   @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: [
          CachedNetworkImage(
            imageUrl: widget.profileImage,
            imageBuilder: (context, imageProvider) => Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
            placeholder: (context, url) => doublbBounce,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          horizontalSpaceTiny,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  regularRobotoText(context,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      text: widget.profileName),
                  horizontalSpaceTiny,
                  Container(
                    height: 15,
                    width: 1,
                    color: AppColors.black,
                  ),
                  horizontalSpaceTiny,
                  regularRobotoText(
                    context,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    text:
                        timeago.format(DateTime.parse(widget.time)).toString(),
                  )
                ],
              ),
              SizedBox(
                height: 2.sp,
              ),
              regularRobotoText(context,
                  fontSize: 12.sp,
                  color: AppColors.black.withOpacity(0.8),
                  text: widget.subName),
            ],
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.more_horiz_outlined)
    ]);
  }
}
