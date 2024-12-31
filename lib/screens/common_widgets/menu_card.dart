import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final VoidCallback onTap;
  const MenuCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black54,
            width: 0.3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: leadingIcon,
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
