import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/constants/app_setting.dart';
import 'package:my_stock/src/constants/asset.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/sso_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: BackgroundTheme.gradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Image.asset(
                  Asset.logoImage,
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 32),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        bottom: 22,
                        left: 22,
                        right: 22,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 22,
                          right: 22,
                          top: 22,
                          bottom: 42,
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                labelText: 'username',
                                icon: Icon(Icons.account_circle),
                                border: InputBorder.none,
                              ),
                            ),
                            Divider(
                              height: 22,
                              indent: 22,
                              endIndent: 22,
                            ),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'password',
                                icon: Icon(Icons.lock),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: _boxDecoration(),
                      width: 280,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          final username = _usernameController.text;
                          final password = _passwordController.text;

                          if (username == '12345678' &&
                              password == '12345678') {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            var token = 'kfsjgl3kr13rani80c8h4y';
                            prefs.setString(AppSetting.tokenSetting, token);
                            prefs.setString(
                                AppSetting.usernameSetting, username);

                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.homeRoute,
                            );
                          } else {
                            print('username or password incorrect!!');
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _buildTextButton(
                  'forgot password?',
                  onPressed: () {
                    //todo
                  },
                ),
                SSOButton(),
                _buildTextButton(
                  'register',
                  onPressed: () {
                    //todo
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    final gradientStart = BackgroundTheme().gradientStart;
    final gradientEnd = BackgroundTheme().gradientEnd;

    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      boxShadow: <BoxShadow>[
        boxShadowItem(gradientStart),
        boxShadowItem(gradientEnd),
      ],
      gradient: LinearGradient(
        colors: [
          gradientEnd,
          gradientStart,
        ],
        begin: const FractionalOffset(0, 0),
        end: const FractionalOffset(1.0, 1.0),
        stops: [0.0, 1.0],
      ),
    );
  }

  Container _buildTextButton(String text, {VoidCallback onPressed}) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      );
}

class SSOButton extends StatelessWidget {
  const SSOButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: SSOViewModel()
            .item
            .map((item) => FloatingActionButton(
                  heroTag: item.backgroundColor.toString(),
                  onPressed: item.onPressed,
                  child: FaIcon(
                    item.icon,
                    color: item.iconColor,
                  ),
                  backgroundColor: item.backgroundColor,
                ))
            .toList(),
      ),
    );
  }
}
