import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.home_outlined,
                    size: 35,
                    color: Colors.grey,
                  )),
              InkWell(
                  onTap: () {
                    // FingerCamera().initializeCamera();
                  },
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 35,
                    color: Colors.grey,
                  )),
              const Text(
                "Save",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

