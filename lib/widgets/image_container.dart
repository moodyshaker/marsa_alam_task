import 'dart:io';
import 'package:flutter/material.dart';

class MyImageContainer extends StatelessWidget {
  final String imagePath;
  final GestureTapCallback? onImagePressed;
  final bool isLoading;

  const MyImageContainer({
    Key? key,
    required this.imagePath,
    required this.onImagePressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mq = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onImagePressed,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                height:
                    mq.orientation == Orientation.portrait && size.width < 400
                        ? size.width * 0.4
                        : size.width * 0.2,
                width:
                    mq.orientation == Orientation.portrait && size.width < 400
                        ? size.width * 0.4
                        : size.width * 0.2,
                child: imagePath == null || imagePath.isEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        child: const Icon(
                          Icons.photo,
                          size: 30.0,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              isLoading
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        color: Colors.black.withOpacity(
                          0.6,
                        ),
                        height: mq.orientation == Orientation.portrait &&
                                size.width < 400
                            ? size.width * 0.4
                            : size.width * 0.2,
                        width: mq.orientation == Orientation.portrait &&
                                size.width < 400
                            ? size.width * 0.4
                            : size.width * 0.2,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              isLoading
                  ? Container()
                  : Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
