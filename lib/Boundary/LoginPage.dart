
import 'package:ezparking/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ezparking/Utils/FormCard.dart';
import 'package:ezparking/Utils/SocialIcon.dart';
import 'package:ezparking/Utils/CustomIcons.dart';

class LoginPage extends StatelessWidget  {
  const LoginPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }
  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }
  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true)..init(context);

    return new Scaffold(
        backgroundColor: Colors.amber.shade100,
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Image.asset('assets/image_01.png')
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset('assets/image_02.png'),
              ],
            ),
            SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                'EzParking',
                                style: TextStyle(
                                  fontFamily: 'Poppins-Bold',
                                  fontSize: ScreenUtil.getInstance().setSp(46),
                                  letterSpacing: .6,
                                  fontWeight: FontWeight.bold,
                                )
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(180),
                        ),
                        FormCard(),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: ScreenUtil.getInstance().setWidth(300),
                                  height: ScreenUtil.getInstance().setHeight(100),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Color(0xFF17ead9), Color(0xFF6078ea)]
                                    ),
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0,
                                      )
                                    ],
                                  ),
                                  child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                          onTap: () {},
                                          child: Center(
                                              child: Text(
                                                  'SIGNIN',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins-Bold',
                                                      fontSize: 18.0,
                                                      letterSpacing: 1.0
                                                  )
                                              )
                                          )
                                      )
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text(
                                'Social Login',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Poppins-Medium',
                                )
                            ),
                            horizontalLine(),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SocialIcon(
                              colors: [
                                Color(0xFF102397),
                                Color(0xFF187adf),
                                Color(0xFF00eaf8),
                              ],
                              icondata: CustomIcons.facebook,
                              onPressed: _signInWithFacebook,
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                                Color(0xFFff355d),
                              ],
                              icondata: CustomIcons.googlePlus,
                              onPressed: _signInWithGoogle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'New User? ',
                              style: TextStyle(
                                  fontFamily: 'Poppins-Medium'
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                  'SignUp',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Color(0xFF5d74e3),
                                  )
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Or? ',
                              style: TextStyle(
                                  fontFamily: 'Poppins-Medium'
                              ),
                            ),
                            InkWell(
                              onTap: _signInAnonymously,
                              child: Text(
                                  'Sign in Anonymously',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Color(0xFF5d74e3),
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    )
                )
            ),
          ],
        )
    );
  }
}