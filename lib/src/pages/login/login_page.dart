import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0XFF2980b9),
                    Color(0XFF2c3e50),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0]),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Image.asset('assets/images/logo.png', width: 150, height: 150,),
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
                    SizedBox(
                      width: 280,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          print('login clicked!!');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('login button'),
                Text('forgot password'),
                Text('sso'),
              ],
            ),
          )
        ],
      ),
    );
  }
}