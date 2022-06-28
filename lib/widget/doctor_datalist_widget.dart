import 'package:flutter/material.dart';
import 'package:innovative/model/doctor_list_model.dart';
import 'package:innovative/utils/assets_manager.dart';
import 'package:innovative/utils/color_manager.dart';
import 'package:innovative/utils/values_manager.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DoctorListWidget extends StatelessWidget {
  DoctorListModel forum;
  DoctorListWidget({Key? key, required this.forum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Container(
        width: AppSize.sizeWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 0.5,
              blurRadius: 8,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          color: ColorManager.white,
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Container(
                            color: ColorManager.white,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ClipOval(
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(forum.imagepath!),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      forum.title!,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: ColorManager.darkblue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Image.asset(
                                            ImageAssets.checkiconImage)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Text(
                                  forum.subtitle!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Text(
                                  forum.description!,
                                  style: TextStyle(
                                    color: ColorManager.grey,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.darkblue,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
              width: 20.0,
              height: 100,
              child: Center(
                  child: Image.asset(
                ImageAssets.arrowForwordicon,
                height: 18,
                width: 18,
              )),
            )
          ],
        ),
      ),
    );
  }
}
