import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_stock/src/configs/app_route.dart';
import 'package:my_stock/src/pages/login/background_theme.dart';
import 'package:my_stock/src/view_models/menu_viewmodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(
        title: Text('home page'),
        backgroundColor: BackgroundTheme().gradientEnd,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => ShopListItem(220),
        itemCount: 100,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //todo
        },
        tooltip: 'Increment',
        backgroundColor: BackgroundTheme().gradientEnd,
        child: Icon(Icons.add),
      ),
    );
  }
}

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://sites.google.com/site/funnycatmeawww/_/rsrc/1422326075261/home/6997052-funny-cat.jpg?height=675&width=1200'),
            ),
            accountName: Text('fluke'),
            accountEmail: Text('12345678@gmail.com'),
            decoration: BoxDecoration(gradient: BackgroundTheme.gradient),
          ),
          ...MenuViewModel().items.map(
                (item) => ListTile(
                  onTap: () {
                    item.onTap(context);
                  },
                  leading: Icon(
                    item.icon,
                    color: item.iconColor,
                  ),
                  title: Text(item.title),
                ),
              ),
          Spacer(),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.loginRoute, (route) => false);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          )
        ],
      ),
    );
  }
}

class ShopListItem extends StatelessWidget {
  final Function press;
  final double maxHeight;

  const ShopListItem(this.maxHeight, {Key key, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildImage(),
            Expanded(
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildInfo() => Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ไก่ทอด',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$ 10.-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '24 pieces',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent,
                  ),
                )
              ],
            ),
          ],
        ),
      );

  Stack _buildImage() {
    final height = maxHeight - 75;
    final productImage =
        'https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/3-CZDHREV3J8MHRA/hero/1d82726bf77a41209ba3ab2bf88ce635_1587015452241240448.jpeg';
    return Stack(
      children: [
        productImage != null && productImage.isNotEmpty
            ? Image.network(
                productImage,
                height: height,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'xxx',
                height: height,
                width: double.infinity,
              ),
        1 > 0
            ? SizedBox()
            : Positioned(
                top: 1,
                right: 1,
                child: Card(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.box,
                          size: 15.0,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'out of stock',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
