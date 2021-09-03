import 'package:cached_network_image/cached_network_image.dart';
import 'package:convre/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeViewHeading extends StatelessWidget {
  final spinkit = SpinKitCircle(
    color: AppColors.red,
    size: 30.0,
  );

  final doublbBounce = SpinKitDoubleBounce(
    color: AppColors.red,
    size: 30.0,
  );

  final String profileImage;
  final String profileName;
  final String subName;
  final String time;

  HomeViewHeading(
      {this.profileImage, this.profileName, this.subName, this.time});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Row(
        children: [
          CachedNetworkImage(
            imageUrl: profileImage,
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
                      text: profileName),
                  horizontalSpaceTiny,
                  Container(
                    height: 15,
                    width: 1,
                    color: AppColors.black,
                  ),
                  horizontalSpaceTiny,
                  regularRobotoText(context,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      text: time),
                ],
              ),
              SizedBox(
                height: 2.sp,
              ),
              regularRobotoText(context,
                  fontSize: 12.sp,
                  color: AppColors.black.withOpacity(0.8),
                  text: subName),
            ],
          ),
        ],
      ),
      Spacer(),
      Icon(Icons.more_horiz_outlined)
    ]);
  }
}
