// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

//     var profileInfo = Expanded(
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: kSpacingUnit.w * 10,
//             width: kSpacingUnit.w * 10,
//             margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
//             child: Stack(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: kSpacingUnit.w * 5,
//                   backgroundImage: AssetImage('assets/images/avatar.png'),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     height: kSpacingUnit.w * 2.5,
//                     width: kSpacingUnit.w * 2.5,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).accentColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       heightFactor: kSpacingUnit.w * 1.5,
//                       widthFactor: kSpacingUnit.w * 1.5,
//                       child: Icon(
//                         LineAwesomeIcons.pen,
//                         color: kDarkPrimaryColor,
//                         size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: kSpacingUnit.w * 2),
//           Text(
//             'Nicolas Adams',
//             style: kTitleTextStyle,
//           ),
//           SizedBox(height: kSpacingUnit.w * 0.5),
//           Text(
//             'nicolasadams@gmail.com',
//             style: kCaptionTextStyle,
//           ),
//           SizedBox(height: kSpacingUnit.w * 2),
//           Container(
//             height: kSpacingUnit.w * 4,
//             width: kSpacingUnit.w * 20,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
//               color: Theme.of(context).accentColor,
//             ),
//             child: Center(
//               child: Text(
//                 'Upgrade to PRO',
//                 style: kButtonTextStyle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

//     var themeSwitcher = ThemeSwitcher(
//       builder: (context) {
//         return AnimatedCrossFade(
//           duration: Duration(milliseconds: 200),
//           crossFadeState:
//               ThemeProvider.of(context).brightness == Brightness.dark
//                   ? CrossFadeState.showFirst
//                   : CrossFadeState.showSecond,
//           firstChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//             child: Icon(
//               LineAwesomeIcons.sun,
//               size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//             ),
//           ),
//           secondChild: GestureDetector(
//             onTap: () =>
//                 ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//             child: Icon(
//               LineAwesomeIcons.moon,
//               size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//             ),
//           ),
//         );
//       },
//     );

//     var header = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(width: kSpacingUnit.w * 3),
//         Icon(
//           LineAwesomeIcons.arrow_left,
//           size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//         ),
//         profileInfo,
//         themeSwitcher,
//         SizedBox(width: kSpacingUnit.w * 3),
//       ],
//     );

//     return ThemeSwitchingArea(
//       child: Builder(
//         builder: (context) {
//           return Scaffold(
//             body: Column(
//               children: <Widget>[
//                 SizedBox(height: kSpacingUnit.w * 5),
//                 header,
//                 Expanded(
//                   child: ListView(
//                     children: <Widget>[
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.user_shield,
//                         text: 'Privacy',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.history,
//                         text: 'Purchase History',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.question_circle,
//                         text: 'Help & Support',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.cog,
//                         text: 'Settings',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.user_plus,
//                         text: 'Invite a Friend',
//                       ),
//                       ProfileListItem(
//                         icon: LineAwesomeIcons.alternate_sign_out,
//                         text: 'Logout',
//                         hasNavigation: false,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// const kSpacingUnit = 10;

// const kDarkPrimaryColor = Color(0xFF212121);
// const kDarkSecondaryColor = Color(0xFF373737);
// const kLightPrimaryColor = Color(0xFFFFFFFF);
// const kLightSecondaryColor = Color(0xFFF3F7FB);
// const kAccentColor = Color(0xFFFFC107);

// final kTitleTextStyle = TextStyle(
//   fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
//   fontWeight: FontWeight.w600,
// );

// final kCaptionTextStyle = TextStyle(
//   fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
//   fontWeight: FontWeight.w100,
// );

// final kButtonTextStyle = TextStyle(
//   fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
//   fontWeight: FontWeight.w400,
//   color: kDarkPrimaryColor,
// );

// final kDarkTheme = ThemeData(
//   brightness: Brightness.dark,
//   fontFamily: 'SFProText',
//   primaryColor: kDarkPrimaryColor,
//   canvasColor: kDarkPrimaryColor,
//   backgroundColor: kDarkSecondaryColor,
//   accentColor: kAccentColor,
//   iconTheme: ThemeData.dark().iconTheme.copyWith(
//         color: kLightSecondaryColor,
//       ),
//   textTheme: ThemeData.dark().textTheme.apply(
//         fontFamily: 'SFProText',
//         bodyColor: kLightSecondaryColor,
//         displayColor: kLightSecondaryColor,
//       ),
// );

// final kLightTheme = ThemeData(
//   brightness: Brightness.light,
//   fontFamily: 'SFProText',
//   primaryColor: kLightPrimaryColor,
//   canvasColor: kLightPrimaryColor,
//   backgroundColor: kLightSecondaryColor,
//   accentColor: kAccentColor,
//   iconTheme: ThemeData.light().iconTheme.copyWith(
//         color: kDarkSecondaryColor,
//       ),
//   textTheme: ThemeData.light().textTheme.apply(
//         fontFamily: 'SFProText',
//         bodyColor: kDarkSecondaryColor,
//         displayColor: kDarkSecondaryColor,
//       ),
// );

// class ProfileListItem extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final bool hasNavigation;

//   const ProfileListItem({
//     Key? key,
//     required this.icon,
//     required this.text,
//     this.hasNavigation = true,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: kSpacingUnit.w * 5.5,
//       margin: EdgeInsets.symmetric(
//         horizontal: kSpacingUnit.w * 4,
//       ).copyWith(
//         bottom: kSpacingUnit.w * 2,
//       ),
//       padding: EdgeInsets.symmetric(
//         horizontal: kSpacingUnit.w * 2,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
//         color: Theme.of(context).backgroundColor,
//       ),
//       child: Row(
//         children: <Widget>[
//           Icon(
//             this.icon,
//             size: kSpacingUnit.w * 2.5,
//           ),
//           SizedBox(width: kSpacingUnit.w * 1.5),
//           Text(
//             this.text,
//             style: kTitleTextStyle.copyWith(
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Spacer(),
//           if (this.hasNavigation)
//             Icon(
//               LineAwesomeIcons.angle_right,
//               size: kSpacingUnit.w * 2.5,
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            // SvgPicture.asset(
            //   icon,
            //   color: kPrimaryColor,
            //   width: 22,
            // ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              // child: TextButton(
              //   style: TextButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //       side: BorderSide(color: Colors.white),
              //     ),
              //     primary: Colors.white,
              //     backgroundColor: Color(0xFFF5F6F9),
              //   ),
              //   onPressed: () {},
              //   child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              // ),
            ),
          )
        ],
      ),
    );
  }
}

const kPrimaryColor = Color.fromARGB(255, 192, 89, 10);
const kPrimaryLightColor = Color.fromARGB(255, 220, 135, 83);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  // fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);
