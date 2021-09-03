import 'package:convre/core/view_model/home_vm.dart';
import 'package:convre/export.dart';
import 'package:convre/view/base_view.dart';
import 'package:convre/view/hompage/widget/body.dart';
import 'package:convre/view/hompage/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

class HomeView extends StatelessWidget {

    final spinkit = SpinKitCircle(
    color: AppColors.colorDeepPink,
    size: 30.0,
  );
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (HomeViewModel model) => model.getHome(),
        builder: (_, HomeViewModel model, __) => Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    verticalSpaceMedium,
                    Row(
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            regularRobotoText(
                              context,
                              text: 'C',
                              fontSize: 35.sp,
                              color: AppColors.colorDeepPink,
                              fontWeight: FontWeight.w700,
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 6,
                                child: Icon(
                                  Icons.more_horiz_outlined,
                                  size: 20,
                                ))
                          ],
                        ),
                        horizontalSpaceSmall,
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: CustomTextField(
                              hintText: 'search',
                              obscureText: false,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        horizontalSpaceSmall,
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.colorDeepPink,
                          child: regularRobotoText(context,
                              text: 'A', color: AppColors.black),
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    Expanded(
                      child: LoadingOverlay(
                          isLoading: model.busy,
                          color: AppColors.grey,
                          progressIndicator: spinkit,
                        child: Container(
                            child: ListView(
                          children: [

                            ListView.separated(
                                separatorBuilder: (context, index) =>
                                    Divider(height: 20, color: Colors.grey),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: model.homepage?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        HomeViewHeading(
                                          profileImage: model.homepage[index]
                                                  ?.profileimage ??
                                              '',
                                          profileName:
                                              model.homepage[index]?.name ?? '',
                                          subName:
                                              '@${model.homepage[index]?.subName}' ??
                                                  '',
                                          time: model.homepage[index]?.time ?? '',
                                        ),
                                        verticalSpaceSmall,
                                        HomeViewBody(
                                          title:
                                              model.homepage[index]?.title ?? '',
                                          bodycontext:
                                              model.homepage[index]?.context ??
                                                  '',
                                          contextImage: model.homepage[index]
                                                  ?.contextImage ??
                                              '',
                                          numOfcomment: model
                                                  .homepage[index]?.messages
                                                  .toString() ??
                                              ''.toString(),
                                          numOflikes: model.homepage[index]?.likes
                                                  .toString() ??
                                              ''.toString(),
                                        ),
                                      ],
                                    ),
                                  );
                                })
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              )),
            ));
  }
}
