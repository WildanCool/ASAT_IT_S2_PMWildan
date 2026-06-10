import 'dart:convert';

import 'package:cars_ecommerce/theme/app_theme.dart';
import 'package:cars_ecommerce/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  List cars = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCars();
  }

  Future<void> getCars() async {
    try {
      final response = await http.get(
        Uri.parse('https://myfakeapi.com/api/cars/'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          cars = data['cars'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        appBar: CustomAppBar(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: cars.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    final car = cars[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primaryOrange.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryOrange,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              car['car'] ?? '-',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          Container(
                            height: 120,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/mobil.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  car['car_model'] ?? '-',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),

                                SizedBox(height: 6),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.palette_outlined,
                                      size: 14,
                                      color: AppTheme.primaryOrange,
                                    ),
                                    SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        car['car_color'] ?? '-',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 4),

                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      size: 14,
                                      color: AppTheme.primaryOrange,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "${car['car_model_year']}",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8),

                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    color: AppTheme.lightOrange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    car['price'] ?? '-',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppTheme.darkOrange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 6),

                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    color: car['availability'] == true
                                        ? Colors.green.shade50
                                        : Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    car['availability'] == true
                                        ? 'Tersedia'
                                        : 'Tidak Tersedia',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: car['availability'] == true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
