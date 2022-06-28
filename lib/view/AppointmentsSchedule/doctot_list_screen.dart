import 'package:flutter/material.dart';
import 'package:innovative/data/doctor_listdata.dart';
import 'package:innovative/widget/doctor_datalist_widget.dart';

import 'package:sizer/sizer.dart';

class checkboxmodel {
  String? title;
  bool? ischecked;
  checkboxmodel({this.title, this.ischecked});
}

class DoctorListView extends StatefulWidget {
  const DoctorListView({Key? key}) : super(key: key);

  @override
  State<DoctorListView> createState() => _DoctorListViewState();
}

class _DoctorListViewState extends State<DoctorListView> {
  //bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: DoctorListWidget(
          forum: doctorList[0],
        ),
      ),
    );
  }
}
