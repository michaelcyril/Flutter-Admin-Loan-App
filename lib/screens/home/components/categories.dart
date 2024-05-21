import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/Cash.svg",
        "text": "Fedha Zote",
        "amount": "Tsh1,000,000",
        "color": Colors.greenAccent, // Green color for this category
      },
      {
        "icon": "assets/icons/Cash.svg",
        "text": "Mikopo Yote",
        "amount": "Tsh230,400",
        "color": const Color(0xFFFFECDF), // Default color for other categories
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right:5),
              child: CategoryCard(
                icon: categories[0]["icon"],
                text: categories[0]["text"],
                amount: categories[0]["amount"],
                backgroundColor: categories[0]["color"],
                press: () {},
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:5),
              child: CategoryCard(
                icon: categories[1]["icon"],
                text: categories[1]["text"],
                amount: categories[1]["amount"],
                backgroundColor: categories[1]["color"],
                press: () {},
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.amount,
    required this.backgroundColor,
    required this.press,
  }) : super(key: key);

  final String icon, text, amount;
  final Color backgroundColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 180,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 8), // Adjust spacing between icon and text
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: backgroundColor == Colors.green ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
