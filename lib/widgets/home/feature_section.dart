import 'package:cars_ecommerce/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48),
      child: Column(
        children: [
          Text(
            "Mengapa Memilih CarPoint?",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.darkOrange,
            ),
          ),

          SizedBox(height: 40),

          Row(
            children: [
              Expanded(
                child: FeatureCard(
                  icon: Icons.verified,
                  title: "Terpercaya",
                  subtitle: "Mobil berkualitas.",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FeatureCard(
                  icon: Icons.price_check,
                  title: "Harga Terbaik",
                  subtitle: "Harga kompetitif.",
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: FeatureCard(
                  icon: Icons.support_agent,
                  title: "Layanan Cepat",
                  subtitle: "Siap membantu.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(icon, size: 48, color: AppTheme.primaryOrange),
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
