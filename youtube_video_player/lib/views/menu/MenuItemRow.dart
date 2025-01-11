import 'package:flutter/material.dart';

class MenuItemRow extends StatelessWidget {
  final Map mObj;
  final VoidCallback onTap;

  const MenuItemRow({Key? key, required this.mObj, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.network(mObj['image'], width: 50, height: 50),  // Replace 'image' with actual field in response
          SizedBox(width: 10),
          Text(mObj['name']),  // Replace 'name' with actual field
          Spacer(),
          Text("Price: ${mObj['price']}"),  // Replace 'price' with actual field
        ],
      ),
    );
  }
}
