import 'package:cars_ecommerce/pages/cars_page.dart';
import 'package:cars_ecommerce/pages/home_page.dart';
import 'package:cars_ecommerce/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          Image.asset("assets/images/logo.png", height: 45),

          SizedBox(width: 12),

          Text(
            "CarPoint",
            style: TextStyle(
              color: AppTheme.primaryOrange,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                "Home",
                style: TextStyle(
                  color: AppTheme.primaryOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(width: 12),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CarsPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                "Mobil",
                style: TextStyle(
                  color: AppTheme.primaryOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
