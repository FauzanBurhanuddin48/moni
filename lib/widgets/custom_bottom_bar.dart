import 'package:flutter/material.dart';
import 'package:moni5/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavBeranda,
      activeIcon: ImageConstant.imgNavBeranda,
      title: "Beranda",
      type: BottomBarEnum.Beranda,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgChart,
      activeIcon: ImageConstant.imgChart,
      title: "Transaksi",
      type: BottomBarEnum.Transaksi,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGroup,
      activeIcon: ImageConstant.imgGroup,
      title: "Anggaran",
      type: BottomBarEnum.Anggaran,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUserCicrleDuotone,
      activeIcon: ImageConstant.imgUserCicrleDuotone,
      title: "Akun",
      type: BottomBarEnum.Akun,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.v,
      decoration: BoxDecoration(
        color: appTheme.gray20002,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: SizedBox(
              height: 45.v,
              width: 56.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 27.v),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        style: theme.textTheme.labelMedium!.copyWith(
                          color: appTheme.black90001,
                        ),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 33.v,
                    width: 35.h,
                    color: appTheme.blueGray900,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                      left: 10.h,
                      right: 11.h,
                      bottom: 12.v,
                    ),
                  ),
                ],
              ),
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 27.v,
                  width: 32.h,
                  color: appTheme.cyan400,
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.labelMediumCyan400.copyWith(
                    color: appTheme.cyan400,
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Beranda,
  Transaksi,
  Anggaran,
  Akun,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
