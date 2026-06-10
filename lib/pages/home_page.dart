import 'package:cars_ecommerce/theme/app_theme.dart';
import 'package:cars_ecommerce/widgets/custom_app_bar.dart';
import 'package:cars_ecommerce/widgets/home/feature_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                decoration: BoxDecoration(color: AppTheme.lightOrange),
                child: Column(
                  children: [
                    Text(
                      "Selamat Datang di CarPoint",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkOrange,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Temukan mobil impian Anda dengan mudah, cepat, dan terpercaya.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 40),

                    Container(
                      height: 300,
                      width: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primaryOrange,
                          width: 2,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/mobil.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        backgroundColor: AppTheme.primaryOrange,
                      ),
                      child: Text(
                        "Lihat Koleksi Mobil",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              FeatureSection(),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                color: AppTheme.primaryOrange,
                child: Column(
                  children: [
                    Text(
                      "Siap Menemukan Mobil Impian Anda?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Jelajahi berbagai pilihan mobil terbaik hanya di CarPoint.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),

                    SizedBox(height: 30),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                      ),
                      child: Text(
                        "Mulai Sekarang",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
