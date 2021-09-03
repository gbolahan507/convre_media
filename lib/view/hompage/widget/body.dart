import 'package:cached_network_image/cached_network_image.dart';
import 'package:convre/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeViewBody extends StatelessWidget {
  final spinkit = SpinKitCircle(
    color: AppColors.red,
    size: 30.0,
  );

  final doublbBounce = SpinKitDoubleBounce(
    color: AppColors.red,
    size: 30.0,
  );

  final String title;
  final String bodycontext;
  final String contextImage;
  final String numOfcomment;
  final String numOflikes;

  HomeViewBody({
    this.title,
    this.bodycontext,
    this.numOfcomment,
    this.numOflikes,
    this.contextImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        regularRobotoText(
          context,
          color: AppColors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          text: title,
        ),
        verticalSpaceSmall,
        regularRobotoText(context,
            color: AppColors.black, fontSize: 14.sp, text: bodycontext),
        verticalSpaceTiny7,
        Center(
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: contextImage,
              height: 200.h,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => doublbBounce,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        verticalSpaceMedium30,
        Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 18,
                ),
                horizontalSpaceSmall,
                regularRobotoText(context,
                    color: AppColors.black,
                    fontSize: 14.sp,
                    text: numOfcomment),
                horizontalSpaceMedium,
                Icon(
                  Icons.arrow_upward_outlined,
                  size: 18,
                ),
                horizontalSpaceSmall,
                regularRobotoText(context,
                    color: AppColors.black, fontSize: 14.sp, text: numOflikes),
                horizontalSpaceSmall,
                Icon(
                  Icons.arrow_downward,
                  size: 18,
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.forward_10_outlined,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}
