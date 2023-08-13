import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_task/utils/my_routes.dart';

class MyDrawer extends StatelessWidget {
  final String email;
  const MyDrawer({super.key, required this.email});
  final imgUrl =
      'https://i.pinimg.com/originals/b4/ae/e6/b4aee619551c49efd46d61517756555f.gif';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: const Text('Anonymous'),
                accountEmail:  Text(email),
                // currentAccountPicture: Image.network(imgUrl),

                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black54,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black54,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.shopping_cart,
                color: Colors.black54,
              ),
              title: const Text(
                'Cart',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.black54),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.cartPageRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
